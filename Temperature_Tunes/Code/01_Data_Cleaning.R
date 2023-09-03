
rm(list=ls())

options(scipen=999)

packages <- list("ncdf4","here","tidyverse","raster","progress","ggplot2",
                 "gganimate","transformr","purrr")



lapply(packages, require,character.only = T)

# Check if "Datasets", "Figures" and "wav_files" folder exists, if not, create it

# List of directories to create
dirs_to_create <- c("Datasets", "Figures", "wav")

# Loop through the directories and create them if they don't exist
for (dir_name in dirs_to_create) {
  dir_path <- here("Temperature_Tunes", dir_name)
  
  if (!dir.exists(dir_path)) {
    dir.create(dir_path)
  }
}




###################################
##### Download data ###
######## 


#### setting a high timeout limit ## setting it to 10 minutes 

options(timeout=600)


# Define the URL
url <- "https://www.ncei.noaa.gov/data/nclimgrid-monthly/access/nclimgrid_tavg.nc"


# Define the destination file path using here()
dest_file <- here("Temperature_Tunes",
                  "Datasets", 
                  "nclimgrid_tavg.nc")


# Download the file
download.file(url, dest_file, mode = "wb")


### read the file ###

temp_data <- brick(here("Temperature_Tunes","Datasets","nclimgrid_tavg.nc"))



###########################
######## This calculates averages across all cells for a given year 
########################
### useful for overall national level analysis ###

#Subset the raster brick to include only layers 781 through 1543

temp_data_subset <- subset(temp_data, 
                           781:nlayers(temp_data))


########
####
################

# Calculate yearly averages
num_years <- ceiling(nlayers(temp_data_subset) / 12)

# Create a progress bar
pb <- progress_bar$new(total = num_years, format = "[:bar] :percent Year :current/:total (:eta/:elapsed)")

yearly_avg_list <- map(1:num_years, function(i) {
  start_layer <- (i-1)*12 + 1
  
  # If it's the last iteration and there are less than 12 layers left, adjust the end_layer
  if (i == num_years) {
    end_layer <- nlayers(temp_data_subset)
  } else {
    end_layer <- start_layer + 11
  }
  
  yearly_layers <- temp_data_subset[[start_layer:end_layer]]
  
  # Calculate the mean without using calc
  yearly_avg <- mean(getValues(yearly_layers), na.rm = TRUE)
  
  # Update progress bar
  pb$tick()
  
  return(yearly_avg)
})


# Convert the list of averages to a data frame
df <- data.frame(Year = 1960:2023, 
                 Average_Temperature = unlist(yearly_avg_list))


### save this file as a csv for sonification ###

write.csv(df,"Temperature_Tunes/Datasets/average_temp.csv",row.names = FALSE)


###########
### 
########## 



  
### create the animated plot ###

animated_plot <- df %>% 
  ggplot(aes(x = Year, y = Average_Temperature)) +
  geom_line(aes(color = Average_Temperature),size = 1) +
  geom_point(aes(color = Average_Temperature),size = 2) +
  scale_color_viridis_c(direction = -1) +
  labs(title = 'Average Temperature in the Contiguous US', 
       x = 'Year',
       y = 'Average Temperature') +
  theme_bw() +
  theme(text = element_text(size = 10)) +
  transition_reveal(Year)


anim_save("Temperature_change.gif",animated_plot)



##################################
########### AVERAGE TEMPERATURE MAPPING ###########
################################## 


### average for each cell ###

options(scipen=999)

## a clean slate !!

rm(list = ls())

#### reading the data again

temp_data <- brick(here("Temperature_Tunes","Datasets","nclimgrid_tavg.nc"))

# Subset the raster brick to include only layers 781 through the end
temp_data_subset <- subset(temp_data, 781:nlayers(temp_data))

# Calculate yearly averages
num_years <- ceiling(nlayers(temp_data_subset) / 12)

yearly_avg_list <- list()

# Initialize a progress bar
pb <- progress_bar$new(total = num_years, format = "[:bar] :percent :elapsedfull")

for (i in 1:num_years) {
  start_layer <- (i-1)*12 + 1
  
  # If it's the last iteration and there are less than 12 layers left, adjust the end_layer
  if (i == num_years) {
    end_layer <- nlayers(temp_data_subset)
  } else {
    end_layer <- start_layer + 11
  }
  
  yearly_layers <- temp_data_subset[[start_layer:end_layer]]
  
  # Calculate the mean for each cell across the selected layers
  yearly_avg <- raster::mean(yearly_layers)
  
  yearly_avg_list[[i]] <- yearly_avg
  
  # Update the progress bar
  pb$tick()
}

# Convert the list of raster layers to a raster stack
yearly_avg_stack <- stack(yearly_avg_list)

# Convert the raster stack to a dataframe
yearly_avg_df <- raster::as.data.frame(yearly_avg_stack, xy=TRUE)

####
## 
### 

old_names <- colnames(yearly_avg_df)

Years <- c(1960:2023)

new_names <- c("Long","Lat",Years)


yearly_avg_df <- yearly_avg_df %>% 
                  rename_at(vars(old_names), ~ new_names)


### Long format ###

# Reshape the data to long format using pivot_longer

columns_to_change <- colnames(yearly_avg_df %>% dplyr::select(`1960`:`2023`))


yearly_avg_long <- pivot_longer(yearly_avg_df,
                                cols = columns_to_change, 
                                names_to = "Year", 
                                values_to = "Temperature")



# Designated folder for saving plots
output_folder <- here("Temperature_Tunes",
                      "Figures")


# function to save plots in the designated folder

create_plot_for_year <- function(year) {
  data_for_year <- yearly_avg_long %>% filter(Year == year)
  
  p <- ggplot(data_for_year, aes(x = Long, y = Lat, fill = Temperature)) +
    geom_tile() +
    scale_fill_viridis_c(direction = -1) +
    theme_minimal() +
    labs(title = paste("Average Temperature for", year),
         x = "Longitude",
         y = "Latitude",
         fill = "Temperature")
  
  # Save the plot in the designated folder
  filename <- file.path(output_folder, paste0("plot_", year, ".png"))
  ggsave(filename, p, width = 10, height = 6)
  
  # Update the progress bar
  setTxtProgressBar(pb, which(unique(yearly_avg_long$Year) == year))
  
  # Print the completion statement
  print(paste("Completed plot for the year", year, "and saved in", filename))
  
  return(filename)
}

# Initialize the progress bar for exporting plots
total_years <- length(unique(yearly_avg_long$Year))


pb <- txtProgressBar(min = 0, max = total_years, style = 3)

# Generate and save plots for each year
saved_files <- lapply(unique(yearly_avg_long$Year), create_plot_for_year)

# Close the progress bar after all plots are exported
close(pb)




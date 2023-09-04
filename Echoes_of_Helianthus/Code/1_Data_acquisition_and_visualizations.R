rm(list = ls())

packages <- list("tidyUSDA","tidyverse","ggplot2","gganimate",
                 "RColorBrewer","here")


lapply(packages, require,character.only = T)

### creating a folder for exporting the figures ###

# Check if "Datasets", "Figures" and "wav_files" folder exists, if not, create it

# List of directories to create
dirs_to_create <- c("Datasets", "Figures", "wav")

# Loop through the directories and create them if they don't exist
for (dir_name in dirs_to_create) {
  dir_path <- here("Echoes_of_Helianthus", dir_name)
  
  if (!dir.exists(dir_path)) {
    dir.create(dir_path)
  }
}



#### API KEY

key <- "D923D273-EDCC-3FA9-AE2B-E5513DD00E06"

## setting the years I want the data from 

years <- c("1976","1977","1978","1979","1980","1981","1982","1983","1984",
           "1985","1986","1987","1988","1989","1990","1991","1992","1993",
           "1994","1995","1996","1997","1998","1999","2000","2001","2002",
           "2003","2004","2005","2006","2007","2008","2009","2010","2011",
           "2012","2013","2014","2015","2016","2017","2018","2019","2020",
           "2021","2022")


### Getting the data from USDA ## 

Sunflower_Yield <- getQuickstat(sector='CROPS',
                                group = "FIELD CROPS",
                                commodity = "SUNFLOWER",
                                category = "YIELD",
                                domain = "TOTAL",
                                key = key,
                                program = 'SURVEY',
                                data_item = "SUNFLOWER, OIL TYPE - YIELD, MEASURED IN LB / ACRE",
                                geographic_level = 'COUNTY',
                                year = years)

## Viewing what the data looks like after download ##

### Looking at the counties and viewing how many times they are represented
Sunflower_Yield %>% dplyr::group_by(county_name) %>% summarise(n()) %>% View() 

###
### removing some of the states and counties which do not have consistent Yield values ###
###

Sunflower_Yield <- Sunflower_Yield %>% 
                       dplyr::filter(county_name != "OTHER (COMBINED) COUNTIES") %>%
                       dplyr::filter(county_name != "OTHER COUNTIES") %>%
                       dplyr::filter(state_name != "CALIFORNIA") %>%
                       dplyr::select(year,state_name,county_name,Value) %>%
                       dplyr::rename(Yield = Value,
                                     State = state_name,
                                     Year = year)


##### Now we need to take the mean values for each state in a given year

Sunflower_mean_yield <- Sunflower_Yield %>% 
                                   dplyr::group_by(Year,State) %>% 
                                   dplyr::summarise(Average_Yield = mean(Yield)) %>% 
                                   dplyr::arrange(State) %>% 
                                   mutate(State = str_to_title(State))


#### exporting the dataset ####

write.csv(Sunflower_mean_yield,
          "Echoes_of_Helianthus/Datasets/Sunflower_Yield.csv",
          row.names = F)



########## 
### 

## Setting up the factors for regions ####

Sunflower_mean_yield$State <- factor(Sunflower_mean_yield$State,
                                            levels = c("South Dakota",
                                                       "Nebraska",
                                                       "Texas",
                                                       "Kansas",
                                                       "Colorado",
                                                       "North Dakota",
                                                       "Minnesota"))


#
#### Now plot ###
###

plot <- Sunflower_mean_yield %>% 
            ggplot(aes(x= Year,
                      y= Average_Yield,
                      group=State,
                      colour = State)) +
            geom_line(size = 1) +
            geom_point() +
            scale_color_manual(values = c("#FC8D62","#8DA0CB","#E78AC3","#A6D854",
                                "#FFD92F","#E5C494","#B3B3B3")) +
            facet_wrap(~State) +
            labs(x = "Years",
                 y="Average Yearly Yield (lb/acre)")  +
            theme(text = element_text(size = 10)) +
            theme_bw() +
            guides(colour = FALSE) ## this line removes the legend


plot

ggsave("Echoes_of_Helianthus/Figures/Sunflower_Yield.jpg")

## animating this plot 

animated_plot <- plot + transition_reveal(Year)

anim_save("Yield.gif",animated_plot)


            






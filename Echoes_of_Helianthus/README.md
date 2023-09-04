# 🌻 Echoes of Helianthus: Sonifying Sunflower Historical Cultivation Data 🎶

📝 **Note**: This is data was also used in a recent machine learning project where interpretable machine learning tecniques were used to assess the impact of climate change on sunflower cultivation in the US. Check out this repo if interested: https://github.com/SamMajumder/Yield_forecast_Sunflowers

📝 **Note**: A cool Shiny app showing the main results of that machine learning project can be found here: https://sammajumder.shinyapps.io/SunScope/ 

## 🌐 Study Region

United States, focusing on states with significant sunflower cultivation such as South Dakota, Nebraska, Texas, Kansas, Colorado, North Dakota, and Minnesota.

![]()

## 🛰️ Data Source

We utilize data from the **USDA's Quick Stats** database to monitor historical sunflower cultivation in the US.

## 📈 Steps to Reproduce

1. **Data Acquisition**: Retrieve sunflower yield data for each year from the USDA using the `tidyUSDA` package.
2. **Data Preprocessing**: Process the data to get average yearly yield for each state. Filter out inconsistent data and states with sparse data.
3. **Data Visualization**: Visualize the processed data using the `ggplot2` package, showcasing the average yearly yield for each state.

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Echoes_of_Helianthus/Sunflower_Yield.jpg)

4. **Data Animation**: Create an animated plot to visualize the changes in sunflower yield over the years using the `gganimate` package.

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Yield.gif)

## 📦 Packages Used

- `tidyUSDA`: For retrieving data from the USDA's Quick Stats database.
- `tidyverse`: For data manipulation and visualization.
- `ggplot2`: For creating static plots.
- `gganimate`: For creating animated plots.
- `RColorBrewer`: For color palettes.
- `here`: For directory management.

## 🎵 Sonification

The ultimate goal of this project is to sonify the sunflower historical cultivation data, transforming the data into an auditory experience. This will allow listeners to "hear" the changes in sunflower cultivation over the years. The sonification process and blended music composition are currently in the works. Stay tuned for updates!

---

## 🔄 How to Reproduce

1. Clone this repository.
2. Install the required R packages.
3. Run the provided R script to fetch the data, preprocess it, and generate visualizations.
4. Check the `Datasets`, `Figures`, and `wav` folders for the generated datasets, figures, and sonified audio files (once available).

---

📝 **Note**: This is a sonification project, aiming to provide a unique auditory perspective on sunflower cultivation trends. The project is still ongoing, and updates will be posted regularly. 




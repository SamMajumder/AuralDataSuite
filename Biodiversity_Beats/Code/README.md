# Biodiversity Beats: Monitoring and Sonifying NDVI Changes in the Sundarbans Mangroves 🎶🌡️

## Overview 

Biodiversity Beats is a data sonification project focused on monitoring and sonifying the changes in the Normalized Difference Vegetation Index (NDVI) in the Sundarbans Mangroves from 2000 to 2023. NDVI is a crucial indicator of vegetation health, and monitoring its changes can provide insights into environmental factors affecting the Sundarbans, a UNESCO World Heritage Site and the largest mangrove forest in the world. By transforming this data into sound, we aim to provide a unique auditory experience of the changes occurring in this vital ecosystem.

## Data Source

The data for this project is sourced from the MODIS (Moderate Resolution Imaging Spectroradiometer) satellite's `MOD13A2` product. This product provides NDVI values at a 16-day interval, which we've aggregated annually for our analysis.

## Data Processing and Calculation

The data processing involves the following steps:

1. **Data Extraction**: We extract the MODIS NDVI data for each year within our study period.
2. **Data Aggregation**: The 16-day interval NDVI data is aggregated to get the mean NDVI value for each year.
3. **Data Visualization**: The mean NDVI values are visualized on a map to show the spatial distribution of vegetation health in the Sundarbans.

## Sonification and Music Composition

The sonification process is currently in progress. We are working on transforming the NDVI data into a musical composition that will represent the changes in the Sundarbans Mangroves over the years. This auditory representation will complement the visual data, providing a holistic experience of the changes in the ecosystem.

## Python Packages and Datasets Used

- **Python Packages**: 
  - `earthengine-api`: For accessing the Google Earth Engine and extracting MODIS data.
  - `geemap`: For mapping and visualization.
  - `pandas`: For data manipulation.
  - `matplotlib`: For data visualization.
  - `rasterio`: For reading and processing raster data.
  - `PIL`: For image processing.
  
- **Datasets**:
  - `MODIS/006/MOD13A2`: This dataset provides NDVI values at a 16-day interval.

## Study Area

The Sundarbans Mangroves span across Bangladesh and India and are the largest mangrove forest in the world. They are home to the famous Royal Bengal Tiger and are a UNESCO World Heritage Site. The region is a complex ecosystem comprising of mangrove forests, swamps, and tidal waterways. Monitoring the NDVI in this area is crucial due to its ecological importance and the threats it faces from climate change, sea-level rise, and human activities.

## Recommendations

1. **Plots**: Trend of NDVI values over the years.
    ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Biodiversity_Beats/Code/NDVI_2000.png)
    ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Biodiversity_Beats/Code/NDVI_2005.png)
    ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Biodiversity_Beats/Code/NDVI_2010.png)
    ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Biodiversity_Beats/Code/NDVI_2010.png)
    ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Biodiversity_Beats/Code/NDVI_2015.png)
    ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Biodiversity_Beats/Code/NDVI_2023.png)
   

3. **Timelapse Video**:
   A timelapse video showing the change in NDVI from 2000 to 2023 
   ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Biodiversity_Beats/Code/Sundarban_Biodiversity_beats.gif)

## Steps to Reproduce

1. Install the necessary Python packages.
2. Authenticate and initialize the Earth Engine API.
3. Define the region of interest (Sundarbans Mangroves).
4. Extract and process the MODIS NDVI data for each year.
5. Visualize the NDVI data on a map.
6. Export the visualized data as PNG images.
7. Create a GIF from the exported images.

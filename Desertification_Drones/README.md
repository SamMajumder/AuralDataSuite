# 🌍 Desertification Drones: Monitoring Desertification in the Sahel Region 🥁

## 🌐 Study Region

The Sahel region, a transitional zone in Africa between the Sahara to the north and the Sudanian Savanna to the south. Covering parts of Senegal, Mauritania, Mali, Burkina Faso, Algeria, Niger, Nigeria, Chad, Sudan, and Eritrea.

![]()

## 🛰️ Data Source

**Datasets**:
  - `MODIS/006/MOD13A2`: We utilize MODIS (Moderate Resolution Imaging Spectroradiometer) satellite imagery to monitor vegetation changes indicative of desertification. This dataset provides NDVI values at a 16-day interval.


## Data Processing and Calculation

1. **Data Acquisition**:   Retrieve MODIS NDVI data for the Sahel region.
2. **Data Preprocessing**: The 16-day interval NDVI data is aggregated to get the mean NDVI value for each year.
3. **Data Visualization**: The mean NDVI values are visualized on a map to show the spatial distribution of vegetation health in the Sahel region. Visualize the processed data using 
                            Python libraries and tools like `folium`, `rasterio`, and `matplotlib` and create a timelapse video of the change in NDVI values over time

   
   **Timelapse video**

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Desertification_Drones/Desertification_timelapse.gif)

## 📦 Packages Used

- `folium`: For interactive map visualizations.
- `rasterio`: To handle raster data.
- `matplotlib`: For colormaps and other visualization utilities.
- `selenium`: For saving folium maps as images.

## 🎵 Sonification

This project aims to transform the desertification data into sound, allowing for an auditory experience of environmental changes. The sonification and blended music composition process is currently in the works. Stay tuned for updates!



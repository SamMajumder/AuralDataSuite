# 🌳 Deforestation Drums: Sonifying Forest Loss in the Chocó-Darién Rainforest 🎶

## 🌐 Study Region

Chocó-Darién Rainforest, a biodiversity hotspot located between Panama and Colombia.

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Deforestation_Drums/Study_area.png)

## 🛰️ Data Source

We utilize the **Hansen Global Forest Change** dataset, specifically the 2019 version (`UMD/hansen/global_forest_change_2019_v1_7`), to monitor forest loss in the Chocó-Darién Rainforest.

## 📈 Steps to Reproduce

1. **Data Acquisition**: Retrieve forest loss data for each year from the Hansen Global Forest Change dataset using the Earth Engine module.
2. **Data Preprocessing**: Process the data to get forest loss for each year, focusing on the Chocó-Darién Rainforest region.
3. **Data Visualization**: Visualize the processed data using the `folium` package, overlaying GeoTIFFs on individual maps to showcase forest loss for each year 
    and create a Timelapse from the images

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Deforestation_timelapse.gif)

## 📦 Packages and Tools Used

- `geemap`: For Earth Engine data visualization.
- `ee`: Earth Engine Python API for data acquisition.
- `PIL`: For image processing.
- `osgeo`: For geospatial data processing.
- `folium`: For creating interactive maps.
- `rasterio`: For reading and writing geospatial raster data.

## 🎵 Sonification

The ultimate goal of this project is to sonify the forest loss data, transforming the data into an auditory experience. This will allow listeners to "hear" the changes in forest cover over the years. The sonification process and blended music composition are currently in the works. Stay tuned for updates!

---

## 🔄 How to Reproduce

1. Clone this repository.
2. Install the required Python packages.
3. Run the provided Python script to fetch the data, preprocess it, and generate visualizations.

---

📝 **Note**: This is a sonification project, aiming to provide a unique auditory perspective on forest loss trends in the Chocó-Darién Rainforest. The project is still ongoing, and updates will be posted regularly.

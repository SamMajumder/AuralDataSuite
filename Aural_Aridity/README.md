# Aural Aridity 🎶🏜️

Welcome to "Aural Aridity", where the intricacies of drought conditions are sonified into evocative musical notes, painting a sonic picture of arid landscapes.

## Overview 🌐

"Aural Aridity" is a project that sonifies the Standardized Precipitation Evapotranspiration Index (SPEI). This sonification, combined with a musical composition, offers listeners a unique perspective on drought conditions over time.

## Data Source and Information 📜

The SPEI data for this project is sourced from the National Centers for Environmental Information (NCEI). SPEI is an index that quantifies drought by considering both precipitation and potential evapotranspiration. It provides a comprehensive measure of water availability and drought severity.

More information about SPEI can we found here: https://journals.ametsoc.org/view/journals/clim/23/7/2009jcli2909.1.xml?tab_body=pdf
and here: https://climatedataguide.ucar.edu/climate-data/standardized-precipitation-evapotranspiration-index-spei

### Study Area 🌎

The study focuses on the contiguous United States, providing insights into the drought conditions prevalent in this vast region.

## Data Processing and Visualization 📊

1. **Data Acquisition and Cleaning**:
   - **R Packages Used**: raster, ncdf4, tidyverse suite of packages
   - Using R, we've acquired the SPEI data from the netCDF file format.
   - Data Cleaning: The raw data was subset to focus on the relevant time frame, ensuring that we captured the essence of drought conditions over the years.

Link to Dataset: https://www.ncei.noaa.gov/pub/data/nidis/indices/nclimgrid-monthly/spei-pearson/nclimgrid-spei-pearson-01.nc

2. **Data Processing**:
   - Yearly Averages: The dataset provides monthly SPEI values. To provide a clearer trend, we calculated the yearly average SPEI for each year between 1960 and 
      2023

3. **Data Visualization**:
   - Plots: We've created plots for each year to visualize the average SPEI. These plots offer a visual representation of the drought trends over a few selected 
     years.

     ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Aural_Aridity/plot_1960.png)
     ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Aural_Aridity/plot_1980.png)
     ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Aural_Aridity/plot_2000.png)
     ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Aural_Aridity/plot_2023.png)

     ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/SPEI.gif)
  
4.  **Timelapse Video**
     This shows the change in SPEI values over a period of 63 years in the contiguous US
     ![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Aural_Aridity/Timelapse_SPEI.gif)

## Sonification Process:
Data to Musical Notes: Using Python, the temperature data will be converted into musical notes. The conversion maps temperature values to specific pitches, creating a unique auditory representation of the data.

## Musical Structure: 
The sonification is structured around a musical blueprint that is currently in the works. This blueprint defines different sections of the musical piece, each with its mood, mode, and root note. The SPEI data is sonified within this structure, ensuring that the data-driven sounds align with the intended musical narrative.

## Blended Music Composition 🎼
While the sonified data provides an auditory representation of temperature changes, the project's essence lies in blending this sonification with a musical composition. This composition will be inspired by the data and will elevate the listening experience.

Note: The blended music composition is currently in progress. Stay tuned for an immersive musical journey that seamlessly integrates data sonification with artistic melodies.   

 **Python Packages Used**:
  - `MIDIUtil`: For generating MIDI files from the data.
  - `pydsmid`: For MIDI manipulations.

The sonification process involved transforming the SPEI data into a musical composition. The SPEI values were mapped to musical notes, with variations in SPEI (drought patterns) resulting in different musical patterns. The composition was structured into different sections, each representing a specific theme or period.

## Reproduction Steps

1. Install the necessary R and Python packages.
2. Load the temperature data.
3. Process and visualize the data.
4. Use the provided sonification blueprint to transform the data into a musical composition.
5. Export the composition as MIDI files.




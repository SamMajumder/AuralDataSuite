## Temperature Tunes 🎶🌡️
Welcome to the "Temperature Tunes" project, where data-driven sounds harmoniously merge with inspired musical compositions to tell the story of temperature changes over time.

## Overview 🌐
In this project, we've embarked on a journey to sonify temperature data from 1960 to 2023. The sonification is not just a mere representation of data in sound but is designed to be integrated with a musical composition, creating a symphonic blend that offers listeners both an intellectual understanding and an emotional connection to the data.

## Data Source and Information 📜
The temperature data for this project is sourced from the National Centers for Environmental Information (NCEI). This dataset, part of the NCLIMGRID product, provides monthly temperature averages across the contiguous US. It's a valuable resource for understanding long-term temperature trends and variations. 

**Link to the dataset:** https://www.ncei.noaa.gov/data/nclimgrid-monthly/access/ 

## Data Processing and Visualization 📊
**1. Data Acquisition and Cleaning:**
Using R, we've acquired temperature data from the netCDF file format, which is commonly used for storing large-scale environmental data. We are only woring with the data which spans from the year 1960 to 2023.

Data Cleaning: The raw data was subset to include only the relevant layers, specifically from 781 through the end of the dataset. This ensured that we focused on the time frame of interest.

**2. Data Processing:**
Yearly Averages: The dataset provides monthly temperature data. To simplify and provide a clearer trend, we calculated the yearly average temperature for each year. This was achieved by averaging the monthly data for each year.

**3. Data Visualization:**
Plots: I've created plots for each year to visualize the average temperature. These plots provide a visual representation of the temperature trends over the years.

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Temperature_Tunes/plot_1960.png)  

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Temperature_Tunes/plot_1980.png) 

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Temperature_Tunes/plot_2000.png) 

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Temperature_Tunes/plot_2023.png) 

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Temperature_Tunes/Temperature_change.gif)

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Temperature_change.gif)

**Timelapse:** 
A timelapse has been crafted to show the changes in temperature over time. This animation provides a dynamic view of how temperatures have evolved.

![](https://github.com/SamMajumder/Data_Viz_Ecology_Sonification_Projects/blob/main/Temperature_Tunes/Timelapse_temperature.gif)

## Data Sonification 🎵

**Sonification Blueprint:**
Our blueprint for sonification consists of various sections, each designed to convey a specific narrative phase of the temperature data:

**Introduction:** Setting the stage with a calm Ionian mode, rooted at note 60.
**Rising Temperatures:** A shift to the Dorian mode with a root note of 62, capturing the gradual increase in temperatures.
**Climax:** The peak of temperature changes, represented in the intense Phrygian Dominant mode with a root note of 64.
**Reflection:** A contemplative phase in the Mixolydian b6 mode, rooted at note 65.
**Resolution:** Moving towards a resolution in the Lydian Augmented mode with a root note of 67.
**Outro:** Concluding the musical journey in the serene Aeolian mode, rooted at note 69.

## Sonification Process:
Data to Musical Notes: Using Python, the temperature data has been converted into musical notes. The conversion maps temperature values to specific pitches, creating a unique auditory representation of the data.

## Musical Structure: 
The sonification is structured around the musical blueprint mentioned above. This blueprint defines different sections of the musical piece, each with its mood, mode, and root note. The temperature data is sonified within this structure, ensuring that the data-driven sounds align with the intended musical narrative.

## Blended Music Composition 🎼
While the sonified data provides an auditory representation of temperature changes, the project's essence lies in blending this sonification with a musical composition. This composition will be inspired by the data and will elevate the listening experience.

Note: The blended music composition is currently in progress. Stay tuned for an immersive musical journey that seamlessly integrates data sonification with artistic melodies.   

 **Python Packages Used**:
  - `MIDIUtil`: For generating MIDI files from the data.
  - `pydsmid`: For MIDI manipulations.

The sonification process involved transforming the temperature data into a musical composition. The temperature values were mapped to musical notes, with variations in temperature resulting in different musical patterns. The composition was structured into different sections, each representing a specific theme or period.

## Reproduction Steps

1. Install the necessary R and Python packages.
2. Load the temperature data.
3. Process and visualize the data.
4. Use the provided sonification blueprint to transform the data into a musical composition.
5. Export the composition as MIDI files.






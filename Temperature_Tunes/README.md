## Temperature Tunes 🎶🌡️
Welcome to the "Temperature Tunes" project, where data-driven sounds harmoniously merge with inspired musical compositions to tell the story of temperature changes over time.

## Overview 🌐
In this project, we've embarked on a journey to sonify temperature data from 1960 to 2023. The sonification is not just a mere representation of data in sound but is designed to be integrated with a musical composition, creating a symphonic blend that offers listeners both an intellectual understanding and an emotional connection to the data.

**Link to the dataset:** https://www.ncei.noaa.gov/data/nclimgrid-monthly/access/ 

## Data Source and Information 📜
The temperature data for this project is sourced from the National Centers for Environmental Information (NCEI). This dataset, part of the NCLIMGRID product, provides monthly temperature averages across the contiguous US. It's a valuable resource for understanding long-term temperature trends and variations.

## Data Processing and Visualization 📊
**1. Data Acquisition and Cleaning:**
Using R, we've acquired temperature data from the netCDF file format, which is commonly used for storing large-scale environmental data. The data spans from the year 1960 to 2023.

Data Cleaning: The raw data was subset to include only the relevant layers, specifically from 781 through the end of the dataset. This ensured that we focused on the time frame of interest.

**2. Data Processing:**
Yearly Averages: The dataset provides monthly temperature data. To simplify and provide a clearer trend, we calculated the yearly average temperature for each year. This was achieved by averaging the monthly data for each year.

**3. Data Visualization:**
Plots: I've created plots for each year to visualize the average temperature. These plots provide a visual representation of the temperature trends over the years.

Recommendation: Insert plots for select years (e.g., 1960, 1980, 2000, 2020) here to give readers a glimpse of the data.

Timelapse: A timelapse has been crafted to show the changes in temperature over time. This animation provides a dynamic view of how temperatures have evolved.

Recommendation: Embed the timelapse here for a captivating visual experience.

## Data Sonification 🎵
Sonification Blueprint:
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

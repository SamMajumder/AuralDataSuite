# -*- coding: utf-8 -*-
"""
Created on Wed May 29 07:35:22 2024

@author: Dr. M
"""

import xarray as xr
import os
import glob
from utils import *
import re
import matplotlib.pyplot as plt
import imageio

### path to file directory 

directory = os.path.join("..","Data")

## list of all files in the directory 

files = glob.glob(os.path.join(directory,"*.nc"))

## load all netcdf files using xarray 

datasets = [xr.open_dataset(file) for file in files]


########
## loop through each element in the netcdf list to create plot 
####

# Loop through each file, create a plot, and store it in the list
# List to store the plots
plots = []
image_files = []  # List to store the paths of saved images

# Loop through each file, create a plot, and store it in the list
for file in files:
    # Extract the year and month from the filename
    match = re.search(r"(\d{4})_(\d{1,2})", os.path.basename(file))
    if match:
        year = match.group(1)
        month = match.group(2)
        label = f"{year}-{month.zfill(2)}"

        # Load the dataset
        ds = xr.open_dataset(file)

        # Create the plot and store it in the list
        fig = plot_dataset(ds, label, variable="t2m", lon="longitude", lat="latitude", cmap='RdYlBu_r')
        plots.append((label, fig))
        
        # Save the figure as an image file
        image_path = f"{label}.png"
        fig.savefig(image_path)
        image_files.append(image_path)
        plt.close(fig)  # Close the figure to free up memory




# Display the plots (example of how to access and display a plot)
for label, fig in plots:
    print(f"Displaying plot for {label}")
    fig.show()




# Create a GIF from the saved images
with imageio.get_writer('timelapse.gif', mode='I', duration=1.0) as writer:
    for image_file in image_files:
        image = imageio.imread(image_file)
        writer.append_data(image)

# Optional: Clean up image files
for image_file in image_files:
    os.remove(image_file)

print("Timelapse GIF created successfully!") 



########## 
#### 







ds = xr.open_dataset(os.path.join("..","Data","2019_1.nc"))

ds

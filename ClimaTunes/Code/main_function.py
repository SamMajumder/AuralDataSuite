# -*- coding: utf-8 -*-
"""
Created on Wed May  8 08:52:46 2024

@author: Dr. M
"""

from utils import *


import os
from dotenv import load_dotenv


def main(): 
    
    # Load environment variables
    load_dotenv()

    # Access variables
    url = os.getenv('url')
    key = os.getenv('key')
    format = 'netcdf'
    product = input("Please enter name of data product: ")
    #product = 'reanalysis-era5-single-levels-monthly-means'
    product_type = input("Please enter the product type: ")
    #product_type = 'monthly_averaged_reanalysis'
    variable = input("Please enter variable name: ")
    #variable = '2m_temperature'
    start_year = int(input("Please enter start year: "))
    end_year = int(input("Please enter end year: "))
    
    years = list(range(start_year, end_year + 1))
    
    
    every_month = input("Do you want data for every month? (yes/no): ").strip().lower()
    if every_month == 'yes':
        months = list(range(1, 13))
    else:
        month_mapping = {
            "january": 1, "february": 2, "march": 3, "april": 4,
            "may": 5, "june": 6, "july": 7, "august": 8,
            "september": 9, "october": 10, "november": 11, "december": 12
        }
        selected_months = input("Please enter the months you want (e.g., January, March, May): ").split(",")
        months = [month_mapping[month.strip().lower()] for month in selected_months if month.strip().lower() in month_mapping]
    
    
    
    # Specify the name that is used to seach for the data
    place_name = input("Please enter a place name, preferably province,state,country,continent: ")
    #place_name = "FLorida, USA"
    # Get place boundary related to the place name as a geodataframe
    gdf = ox.geocode_to_gdf(place_name)
    # Check the data type
    # Assuming df is your DataFrame and you are interested in the first row
    #########
    bounds = gdf.total_bounds  
    #####
    north = bounds[3]
    west = bounds[0]
    south = bounds[1]
    east = bounds[2] 

    # Now put them into a list in the order: [north, west, south, east]
    area = [north, west, south, east] 
    
    ## enter folder and subfolder names to where the data needs to be downloaded
    download_folder_hierarchy = input("enter folder and subfolder names to where the data needs to be downloaded: ")
    
    download_folder = os.path.join("..",download_folder_hierarchy)
    
    ## check if the folder or folders exist, if not then create it
    
    if not os.path.exists(download_folder):
        os.makedirs(download_folder)
        print(f"Created the directory: {download_folder}")
    else:
        print(f"Directory already exists: {download_folder}")


    #download_folder = os.path.join("..","Data","RawData")
    time = '00:00'

    # Loop over each year and month to download the data
    for year in years:
        for month in months:
            download_cds_data(url, key, product, product_type, format, variable,
                                       year, month, area, download_folder, time) 
            
            
    
    ####convert the netcdfs to pandas dataframe ###
    #df = netcdf_to_pandas(directory_path=os.path.join("..","Data","RawData")) 
    
    # Convert the netCDF files to pandas DataFrame
    df = netcdf_to_pandas(directory_path=download_folder)
    print(f"Data converted to DataFrame: {df}")


    # Ask the user to select columns for note mapping, velocity mapping, and duration mapping
    print("Available columns in the dataset:", df.columns.tolist())
    note_column = input("Select column for note mapping: ")
    velocity_column = input("Select column for velocity mapping: ")
    duration_column = input("Select column for duration mapping: ")

    # Ask the user if they want inverse mapping for notes, velocity, and duration
    reverse_note_mapping = input("Inverse note mapping? (yes/no): ").lower() == 'yes'
    reverse_velocity_mapping = input("Inverse velocity mapping? (yes/no): ").lower() == 'yes'
    reverse_duration_mapping = input("Inverse duration mapping? (yes/no): ").lower() == 'yes'

    # Ask the user to select a scale, instrument, and tempo
    scale_name = input(f"Select scale (available scales: {list(scales.keys())}): ")
    instrument_name = input("Select instrument (e.g., 'Glockenspiel'): ")
    tempo = int(input("Enter the tempo (e.g., 120): "))
    
    # Ask the user for the duration mapping limits
    lower_limit = float(input("Enter the lower limit for note duration (e.g., 0.1): "))
    upper_limit = float(input("Enter the upper limit for note duration (e.g., 4): "))

    # Ask the user for an output directory path
    output_dir = input("Enter the path to the output directory: ")
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    midi_output_file = os.path.join(output_dir, 'sonification.mid')

    # Convert the data to MIDI with the specified mappings
    midi_data = convert_to_midi(
        column=df[note_column],
        output_file=midi_output_file,
        velocity_column=df[velocity_column],
        duration_column=df[duration_column],
        scale_name=scale_name,
        instrument_name=instrument_name,
        tempo=tempo,
        reverse_note_mapping=reverse_note_mapping,
        reverse_velocity_mapping=reverse_velocity_mapping,
        reverse_duration_mapping=reverse_duration_mapping,
        lower_limit=lower_limit,
        upper_limit=upper_limit
    )

    total_duration = sum([note.end for note in midi_data.instruments[0].notes]) - sum([note.start for note in midi_data.instruments[0].notes])
    
    print(f"Total duration of the track: {total_duration} seconds")
    print(f"Midi file saved to {midi_output_file}") 
    
    



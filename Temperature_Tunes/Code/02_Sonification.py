# -*- coding: utf-8 -*-
"""
Created on Tue Aug 29 22:48:35 2023

@author: samba
"""


# Read the file using pandas
import pandas as pd
import numpy as np
from midiutil import MIDIFile
import os 

df = pd.read_csv("C:/Users/samba/Documents/Temperature_Tunes/Datasets/average_temp.csv")

# Define the blueprint
blueprint = [
    {"section": "Introduction", "duration": 16, "mode": "Ionian", "root_note": 60},
    {"section": "Rising Temperatures", "duration": 32, "mode": "Dorian", "root_note": 62},
    {"section": "Climax", "duration": 24, "mode": "Phrygian Dominant", "root_note": 64},
    {"section": "Reflection", "duration": 32, "mode": "Mixolydian b6", "root_note": 65},
    {"section": "Resolution", "duration": 24, "mode": "Lydian Augmented", "root_note": 67},
    {"section": "Outro", "duration": 16, "mode": "Aeolian", "root_note": 69}
]





## Define a function to sonify data
def sonify(section, data, root_note, output_folder="."):
    midi = MIDIFile(1)
    midi.addTempo(0, 0, 40)  # 40 BPM

    # Convert temperature to pitch (this is a simple mapping, can be adjusted)
    min_temp = data.min()
    max_temp = data.max()
    pitches = [int((temp - min_temp) / (max_temp - min_temp) * 12 + root_note) for temp in data]

    for i, pitch in enumerate(pitches):
        midi.addNote(0, 0, pitch, i, 1, 100)

    # Create a directory for the section if it doesn't exist
    section_path = os.path.join(output_folder, section)
    if not os.path.exists(section_path):
        os.makedirs(section_path)

    with open(os.path.join(section_path, f"{section}.mid"), "wb") as midi_file:
        midi.writeFile(midi_file)

# Split data into chunks for each section
chunks = np.array_split(df['Average_Temperature'], len(blueprint))

# User-defined output folder
output_path = "C:/Users/samba/Documents/Temperature_Tunes/wav_files"  # Replace with your desired path

for section, data_chunk in zip(blueprint, chunks):
    sonify(section['section'], data_chunk, section['root_note'], output_folder=output_path)
    print(f"Created {section['section']}.mid with root note {section['root_note']} in the {section['section']} folder inside {output_path}")
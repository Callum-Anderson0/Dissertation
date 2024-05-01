
from page import *
import random
import os

#Defines the grouping rules, the number corresponds to the propagating value we describe in
# the report
rules = {"Intercepting":0,
         "Near":0,
         "Near and Aligned": 0,
         "Connected":0,
         "Aligned":0,
         "Length":1,
         "Near and Similar":0}

def generate_bright_colour(): #Generates a hexcode for a colour to be passed the processing canvas
    red = random.randint(50,255)
    green = random.randint(50,255)
    blue = random.randint(50,255)
    color_hex = "FF{:02x}{:02x}{:02x}".format(red,green,blue)
    return color_hex

if __name__ == '__main__':

    #This section of code runs the script which launches the application and analyses the line segements.
    #It is possible to change the path of csv to load different .csvs in for analysis.

    p = Page(0)
    p.load_csv(r"data/DrawingTool/drawing247.csv")
    p.init_adjacency_matrix()
    p.adjacency_matrix.cull_edges()
    p.adjacency_matrix.describe_graph()
    subgroups = p.adjacency_matrix.bfs_subgroups()
    p.set_group_colour(subgroups)
    p.to_df()
    p.to_csv(r"data\test.csv")
    os.startfile(r"C:\Users\callu\PycharmProjects\VisualizingBars\visualising_bars")


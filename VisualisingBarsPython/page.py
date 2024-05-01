import math

import pandas as pd
import random
from main import *
from bar import *
from AdjacencyMatrix import *


class Page:
    size = 0
    bar_df = None
    bars = []
    adjacency_matrix = None

    def __init__(self,size):
        self.size = size
        print()

    def generate_bars_random_coordinates(self): #generates bars from points that could be evenly placed anywhere on the screen.
        for i in range(self.size):
            bar_coordinates = []
            for j in range(4):
                bar_coordinates.append(random.randint(0, 800))
            bar_color = "FFFFFFFF"
            self.bars.append(
                Bar(i, bar_coordinates[0], bar_coordinates[1], bar_coordinates[2], bar_coordinates[3], bar_color))

    def generate_bars_random_direction(self, minsize, maxsize): #Uses trigonometry to generate random bars with a maximum length.
        for i in range(self.size):
            bar_coordinates = []
            bar_color = "FFFFFFFF" # generate_bright_colour()
            for j in range(2):
                bar_coordinates.append(random.randint(0, 800))
            bar_direction = random.random()*2* math.pi
            bar_length = random.randint(minsize, maxsize)
            self.bars.append(Bar(i, bar_coordinates[0], bar_coordinates[1],
                             bar_coordinates[0] + bar_length * math.cos(bar_direction),
                             bar_coordinates[1] + bar_length * math.sin(bar_direction), bar_color))


    def load_csv(self,path):
        df = pd.read_csv(path);
        for index,row in df.iterrows():
            self.bars.append(Bar(row['id'],row['start.x'],row['start.y'],row['end.x'],row['end.y'],"FFFFFFFF"))
        for b in self.bars:
            print(b)

    def to_csv(self, path):
        self.bar_df.to_csv(path)

    def init_adjacency_matrix(self):
        self.adjacency_matrix = AdjacencyMatrix(self.bars)
        self.adjacency_matrix.populate()

    def to_df(self):
        self.bar_df = pd.DataFrame(columns=('id', 'start.x', 'start.y', 'end.x', 'end.y', "colour"))
        for entry in self.bars:
            row = pd.Series({'id': entry.id,
                             'start.x': entry.start.x,
                             'start.y': entry.start.y,
                             'end.x': entry.end.x,
                             'end.y': entry.end.y,
                             'colour': entry.colour})
            self.bar_df = pd.concat([self.bar_df, pd.DataFrame([row], columns=row.index)]).reset_index(drop=True)

    def set_group_colour(self, subgroups):
        for s in subgroups:
            bar_color = generate_bright_colour()
            for n in s:
                self.bars[n].colour = bar_color

    def __str__(self):
        contents = ""
        # for bar in self.bars:
        #    contents += str(bar) + "\n"
        contents = (str(entry) + "\n" for entry in self.bars)
        return contents

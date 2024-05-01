import bar
from RelationProperty import *
import math
import copy
import numpy as np


class SpatialRelation:
    def __init__(self):
        self.bar_a = None
        self.bar_b = None
        self.properties = []

    def get_dict(self):
        property_dict = {}
        for prop in self.properties:
            property_dict[prop.name] = prop.value
        return property_dict

    def compare(self, bar_a, bar_b):
        self.bar_a = bar_a
        self.bar_b = bar_b

        self.properties.append(RelationProperty("Intercepting", self.intercepting()))
        self.properties.append(RelationProperty("Aligned",self.aligned(0.95),))
        self.properties.append(RelationProperty("Near", self.near(50)))
        self.properties.append(RelationProperty("Near and Aligned",self.near_and_aligned(40,0.95)))
        self.properties.append(RelationProperty("Connected",self.connected(12)))
        self.properties.append(RelationProperty("Length",self.length_similarity(0.4)))
        self.properties.append(RelationProperty("Near and Similar",self.near_and_length()));


    def intercepting(self):
        # This implementation is based on determining if two lines intersect by solving the simultaneous equations
        # formed by the equations of lines.
        determinant = (self.bar_a.start.x - self.bar_a.end.x) * (self.bar_b.start.y - self.bar_b.end.y) - (
                    self.bar_a.start.y - self.bar_a.end.y) * (self.bar_b.start.x - self.bar_b.end.x);
        if determinant == 0:
            return False
        t = ((self.bar_a.start.x - self.bar_b.start.x) * (self.bar_b.start.y - self.bar_b.end.y) - (
                    self.bar_a.start.y - self.bar_b.start.y) * (self.bar_b.start.x - self.bar_b.end.x)) / determinant;
        u = -((self.bar_a.start.x - self.bar_a.end.x) * (self.bar_a.start.y - self.bar_b.start.y) - (
                    self.bar_a.start.y - self.bar_a.end.y) * (self.bar_a.start.x - self.bar_b.start.x)) / determinant;
        return 0 <= t <= 1 and 0 <= u <= 1

    def near_and_aligned(self,tolerance1,tolerance2):
        return self.near(tolerance1) and self.aligned(tolerance2)

    def near(self,tolerance):
        distance = math.dist(self.bar_a.start,self.bar_b.start)
        return distance < tolerance;

    def aligned(self,tolerance):
        print(self.bar_a.id,self.bar_b.id)
        dot_product = copy.deepcopy(self.bar_a.span).normalize().dot(copy.deepcopy(self.bar_b.span).normalize())
        return dot_product > tolerance

    def length_similarity(self,tolerance):
        length_a = self.bar_a.span.length
        length_b = self.bar_b.span.length
        return length_b * (1 - tolerance) < length_a < length_b * (1 + tolerance)

    def near_and_length(self):
        return self.length_similarity(0.1) and self.near(100);



    def connected_check(self,tolerance):
        dist = [math.dist(self.bar_a.start,self.bar_b.start),
                math.dist(self.bar_a.end,self.bar_b.end),
                math.dist(self.bar_a.start,self.bar_b.end),
                math.dist(self.bar_a.end,self.bar_b.start)]
        return any(d < tolerance for d in dist)


    def __str__(self):
        concat = "(" + str(self.bar_a.id) + "," + str(self.bar_b.id) + ")"
        for prop in self.properties:
            concat += str(prop)
        return concat

import vectormath as vmath
import copy

class Bar:
    #this is a simple storage class as defined in the

    def __init__(self, id, start_x, start_y, end_x, end_y, colour):
        self.id = id
        self.start = vmath.Vector2(start_x, start_y)
        self.end = vmath.Vector2(end_x, end_y)
        self.colour = colour
        self.span = vmath.Vector2(end_x-start_x,end_y-start_y)

    def __str__(self):
        return str(self.id) + str(self.start) + str(self.end) + str(self.colour)

    def df_row(self):
        return [self.id, self.start.x, self.start.y, self.end.x, self.end.y, self.colour]

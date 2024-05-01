class RelationProperty:
    def __init__(self, name, value):
        self.name = name
        self.value = value

    def __str__(self):
        return self.name + " " + str(self.value) + " "

    def get_dict(self):
        return {self.name: self.value}


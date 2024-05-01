from SpatialRelation import *
from RelationProperty import *
import matplotlib.pyplot as plt
import networkx as nx
import copy
import main


class AdjacencyMatrix:
    def __init__(self, bars):
        self.bars = bars
        self.matrix = []
        self.graph = nx.Graph()

    def populate(self):
        for a in self.bars:
            self.graph.add_node(a.id)

        for a in self.bars:
            row = []
            for b in self.bars:
                if a == b:
                    row.append(None)
                else:
                    relation = SpatialRelation()
                    relation.compare(a, b)
                    row.append(relation)
                    self.graph.add_edge(a.id, b.id)
                    attributes = {(a.id, b.id): relation.get_dict()}
                    nx.set_edge_attributes(self.graph, attributes)
            self.matrix.append(row)

    def display_graph(self):
        nx.draw(self.graph, with_labels=True)
        plt.show()

    def ids_to_subgraphs(self,ids):
        subgraph = []
        for id in ids:
            subgraph.append(self.graph.subgraph(id))
        return subgraph

    def display_subgraphs(self,subgroup_ids):
        plot_size = math.ceil(math.sqrt(len(subgroup_ids)))
        subgraphs = self.ids_to_subgraphs(subgroup_ids)

        #plt.figure(fullscreen=True)
        for i in range(1,10):
            plt.subplot(3,3,i)
            nx.draw(subgraphs[i],with_labels=True)

        fm = plt.get_current_fig_manager()
        fm.window.state = ('zoomed')
        plt.show()

    def describe_graph(self):
        for u, v, data in self.graph.edges(data=True):
            print(f" Edge({u},{v})):{data}")

    def find_subgraph_subgroups(self):
        subgroups = [self.graph.subgraph(c).copy() for c in nx.connected_components(self.graph)]
        subgroups = [s for s in subgroups if len(s.nodes()) > 1]
        return [s.nodes() for s in subgroups]

    def find_subgroup_altered_bfs(self, start):
        queue = []
        visited = []
        queue.append(start)
        visited.append(start)
        while len(queue) > 0:
            current_node = queue[0]
            queue.remove(queue[0])
            neighbours = self.find_neighbours(current_node, main.rules)
            for neighbour in neighbours[0]:
                if neighbour not in visited:
                    queue.append(neighbour)
                    visited.append(neighbour)
            for neighbour in neighbours[1]:
                if neighbour not in visited:
                    visited.append(neighbour)
        return visited

    def find_neighbours(self, node, rules):
        neighbours = []
        non_expanding_neighbours = []
        for neighbour in self.bars:
            if neighbour != node:
                relation = self.matrix[node.id][neighbour.id]
                for prop in relation.properties:
                    if prop.value and rules[prop.name] == 1:
                        neighbours.append(neighbour)
                    if prop.value and rules[prop.name] == 2:
                        non_expanding_neighbours.append(neighbour)
        return neighbours, non_expanding_neighbours

    def bfs_subgroups(self):
        subgroups = []
        for node in self.bars:
            subgroups.append(self.find_subgroup_altered_bfs(node))
        subgroup_ids =[]
        for subgroup in subgroups:
            subgroup_ids.append(self.list_of_bars_to_integers(subgroup))
        subgroup_ids = [s for s in subgroup_ids if len(s)>1 ]
        subgroup_ids = set([tuple(s) for s in subgroup_ids])
        subgroup_ids = sorted(subgroup_ids, key=len,reverse=True)
        print(subgroup_ids)
        return subgroup_ids

    def integers_to_list_of_bars(self,input):
        return [b for b in self.bars if b.id in input]

    def list_of_bars_to_integers(self,input):
        output = []
        for b in input:
            output.append(b.id)
        return output

    def cull_edges(self):
        copy_of_edges = copy.deepcopy(self.graph.edges(data=True))
        for u, v, data in copy_of_edges:
            if all(value == False for value in data.values()):
                self.graph.remove_edge(u, v)

    def cull_edges_rules(self):
        print("hi")

    def __str__(self):
        concat = ""
        for row in self.matrix:
            for element in row:
                concat += str(element) + "\n"
        return concat

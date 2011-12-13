"""
Overview
-------

At any point in time we need to store two key pieces of information about each
node.

1. The nodes' probability distribution over the set of the labels.
2. The node's adajacency list.

To do this, we generate two types of tuples.

1. Tuples that contain label information of the form (k, (l, p))
2. Tuples that contain adjacency information of the form (u, v)

Where l is a label, p, its probability, and u, v both vertices in the graph.
"""


def mapper(key, value):
  follower, followed = value.split()
  yield follower, followed

def reducer(key, values):
  key = int(key)
  yield key, key, 1.0
  for v in values:
    yield key, int(v)

if __name__ == "__main__":
  import dumbo
  dumbo.run(mapper, reducer)


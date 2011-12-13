"""
Overview
--------

In this stage, we run the actual adsorption algorithm, by first aggregating
the tuples into a cohesive unit, and then voting and deconstructing it back
into updated tuples.
"""
from __future__ import division
from collections import Counter


def mapper(key, value):
  """
  The map just needs to regurgitate the tuples so that they can be indexed.
  """
  try:
    u, v = value.split("\t")
  except:
    k, l, p = value.split("\t")
    yield int(k), (int(l), float(p))
  else:
    yield int(u), int(v)

def reducer(key, values):
  """
  Tally votes and cast new ones.
  """
  adjacent = set()
  labels = Counter()

  # Build adjacency list and tally votes
  for value in values:
    if type(value) == tuple:
      l, p = value
      labels[l] += p
    else:
      adjacent.add(value)

  # Normalize votes
  total = sum(labels.values())
  for label in labels:
    labels[label] /= total

  # Cast votes
  if len(adjacent) > 0:
    for label in labels:
      vote = labels[label] / len(adjacent)
      for node in adjacent:
        yield node, label, vote

  # Respawn adjacency list
  for node in adjacent:
    yield key, node

if __name__ == "__main__":
  import dumbo
  dumbo.run(mapper, reducer)

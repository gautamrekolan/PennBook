"""
Overview
--------

In this stage we simply read the label distribution, tally them, and print
them out so we can make recommendations.
"""
from __future__ import division
from collections import Counter


def mapper(key, value):
  """
  The map just needs to regurgitate the tuples so that they can be indexed.
  """
  try:
    k, l, p = value.split("\t")
  except ValueError:
    pass
  else:
    yield int(k), (int(l), float(p))

def reducer(key, values):
  """
  Tally votes and cast new ones.
  """
  labels = Counter()

  # Build adjacency list and tally votes
  for value in values:
    if type(value) == tuple:
      l, p = value
      labels[l] += p

  # Normalize votes and print them
  total = sum(labels.values())
  for label in labels:
    yield key, label, labels[label] / total


if __name__ == "__main__":
  import dumbo
  dumbo.run(mapper, reducer)

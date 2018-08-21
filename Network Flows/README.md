#  Network Flows

A network is a directed graph with a source node, s, and a sink node, t. Each edge (v, w) in the graph has a positive capactiy c(v, w).

Example:

<img src="img/networkExample.png" />

## Raw Flow

A raw flow is a function of two vertices r(v, w) >= 0, where (v, w) is an edge in the graph. It must satisfy the following properties:

- Capacity: r(v, w) <= c(v, w) for all edges (v, w) in the graph

- Balance: For all nodes other than s and t, sum of raw flow in = sum of raw flow out

## Net Flow

A net flow is a function of two vertices f(v, w), where v and w are vertices in the graph. It must satisfy the following properties:

- Skew symmetry: f(v, w) = -f(w, v)

- Capacity: f(v, w) <= c(v, w) for all pairs of vertices (v, w) in the graph

- Balance: For all nodes v other than s and t, the sum of the net flow f(v, w) for all neighbors w must be 0

## Value of a Flow

The value of a flow is given by the sum of the net flows f(s, v) for source node s and all neighbors of the source v.

An analagous definition is the sum of the net flows f(v, t) for sink node t and all neighbors of the sink v.

## Maximum Flow

The maximum flow problem is to find a flow with maximum value that satisfies all constraints of a flow function.

We must establish some definitions before explaining the algorithm.




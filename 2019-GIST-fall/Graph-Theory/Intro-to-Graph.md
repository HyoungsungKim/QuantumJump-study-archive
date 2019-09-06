# Intro to Graph Theory

What is graph?

My definition : Kind of Topology which is consisted of nodes and edges

## Topology

- Graph(G) = (vertices(V), edges(E))
- $V = \{ V_1, V_2, V_3, ..., V_n \}$
- Edge is 2 elements subsets of vertices
  - $f = \{V_1, V_2 \}$
- Single graph
  - Graph which doesn't have multi edges or loop
- Directed graph : Edges of directed graph has direction
- Undirected graph : Edges of undirected graph don't have direction
  - Default graph form

### Adjacent and Incident 

- Adjacent : If two nodes share one edge, then these ***nodes*** are called adjacent ***(point of vertex)***
- Incident : If two nodes share one edge, then this ***edge*** is called incident ***(point of edge)***
  - For example, node A and B share edge e, then A is adjacent to B, e is incident of A, e is incident of B

### Graph compliment

- Similar concept with compliment of set
- Same node but totally different edges
- Original graph == compliment of (compliment of graph)

### Peterson graph

- Peterson graph is an undirected graph with 10 vertices and 15 edges. 
- It is a small graph that serves as a useful example and counterexample for many problems in graph theory.
- Basically pentagon with pentagram-star
- It has many ***isomorphism***
  - Isomorphism : Graph can be visualized as various form

$$
f: v -> v^` \\
{\text Such \ that \ } \{u, v\}\ exists \ edge \\
{\text Iff \ f(u)(f(v) \ exists \ edge^`}
$$

> 노드 n과 v 사이에 edge가 존재 하면 f(u)와 f(v) 사이에서도 edge가 존재 함
>
> f(u)는 u^\`, f(v)는 v^\`

### Independent Set 

- Subset of not adjacent nodes
- The largest number of elements of independent set  is $\alpha(G)$
- $\alpha(petersen graph)$ is 4

### Bipartite graph

- Generalized name : r-partite graph
- A graph which all of nodes are colored just 2 color
  - Adjacent nodes have to be colored with different color
  - Bipartite graph doesn't have odd cycle
  - ***Odd cycle means the number of edges in cycle is odd***
  - It means ***If G has (2k + 1) cycle, then G is not bipartite***

### Induced subgraph

- Induced subgraph can be constructed by deleting vertices, but no more edges. 
- If additional edges are deleted, the subgraph is not induced

### Complete graph

- graph that all of possible edges are connected (= clique)
  - clique include complete subgraph






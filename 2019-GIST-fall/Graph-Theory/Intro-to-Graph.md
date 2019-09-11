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

### Walk, trail, path, cycle, girth

- Walk : ***List of vertices and edges***
  - example) v_0, e_1, e_2, ... , e_k, v_k
  - The length of walk is k(the number of edges)
  - ***Closed walk*** : Walk which are start point and end point is same
- Trail : Walk with no repeated edge
  - Vertices can be repeated
- Path : Trail with no repeated vertices
  - Walk with no repeated vertices and trail
- Cycle : ***Trail*** whose the only repeated vertex is the initial vertex and end vertex
  - ***Cycle is closed walk where vertices and edges are not repeated***
- Circuit : Closed walk where vertices can repeat, but not edges
- Girth : A length of the smallest cycle
- The length of walk, trail, path or cycle : Its number of edges

#### ***Lemma*** : Every u, v-walk contains a u, v-path

- u에서 v로 도달하는 walk가 있으면 u-v path가 존재

### Bipartite graphs

#### ***Lemma*** : Every ***closed*** odd walk contains an odd cycle

- P(k) : Every (2k + 1) closed walk contains an odd cycle
- If we could prove that P(k) is true for all k = 0, 1, 2, ..., then we prove Lemma
  - Let's divide walks as 2 parts l_1 and l_2 (l_1 + l_2 = 2k + 1)
  - ***Only even + odd number can be a odd number, Therefore one of l_1 or l_2 is odd length walk***
- Is the above lemma true when we replace "odd" to "even"?
  - Every closed even walk contains an even walk?
  - No!
  - v_1 - e - v_2 : even node but odd walk

- P(l) : Length of u-v walk
- If P(n) is true for n < l then p(l) is true

#### Definition of bipartition

- Definition : A bipartition of G is a specification of two disjoint independent sets in G whose union is V(G)

> Graph의 인접하지 않은 vertices의 집합

- Theorem : A graph is bipartite ***if and only if*** it has no odd cycle

> Bipartite graph : 2가지 색을 사용하여 그래프의 인접 vertex를 다른색으로 칠할 수 있음

- By theorem, we can prove graph is bipartite or not by suggesting odd cycle.
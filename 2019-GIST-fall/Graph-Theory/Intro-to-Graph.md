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
- ***The length of walk, trail, path or cycle : Its number of edges***

#### ***Lemma*** : Every u, v-walk contains a u, v-path

- u에서 v로 도달하는 walk가 있으면 u-v path가 존재

### Bipartite graphs

#### ***Lemma*** : Every ***closed*** odd walk contains an odd cycle

- Walk : List of vertices and edges
  - Length of walk is the number of edge
- Cycle : Closed walk where vertices and edges are not repeated
- P(k) : Every (2k + 1) closed walk contains an odd cycle
- If we could prove that P(k) is true for all k = 0, 1, 2, ..., then we prove Lemma
  - Length 1 closed walk : 1 vertex and 1 edge(loop) => v - e - v
  - Let's divide walks as 2 parts $l_1$ and $l_2$ $(l_1 + l_2 = 2k + 1)$
  - ***Only even + odd number can be a odd number, Therefore one of $l_1$ or $l_2$ is odd length walk***
- Is the above lemma true when we replace "odd" to "even"?
  - Every closed even walk contains an even walk?
  - No!
  - $v_1 - e - v_2$ : even node but even walk ([e, e] repeat e 2 times)
  - $v_1 - e - v_2 - e - v_1$ : even length walk, no cycle
  - $v_1 - e_1 - v_2 - e_2 - v_1$ : even node, even walk ([e1, e2])
    - even length, even cycle
  - Therefore not every even closed walk doesn't contain cycle
  - If even walk does not contain repeated edges, then it can contain cycle
    (Read book - 24p 1.2.16. Remark)
- P(l) : Length of u-v walk
- If P(n) is true for n < l then p(l) is true

#### Definition of bipartition

- Definition : A bipartition of G is a specification of two disjoint independent sets in G whose union is V(G)

> Graph의 인접하지 않은 vertices의 집합

- Theorem : A graph is bipartite ***if and only if*** it has no odd cycle

> Bipartite graph : 2가지 색을 사용하여 그래프의 인접 vertex를 다른색으로 칠할 수 있음

- By theorem, ***we can prove graph is bipartite graph or not by suggesting odd cycle.***
  - If there is a odd cycle, then it is not bipartite graph

#### Relationship of complete graph and bipartite graph

- ***The complete graph $K_n$ can be expresses as the union of k bipartite graphs if and only if $n <= 2^k$***

> Complete graph : Simple undirected graph in which every pair of distinct vertices is connected by a unique edge.(서로 다른 두 꼭지점이 반드시 하나의 변으로 연결된 그래프)

Proof)

- When k = 1, k= 2, bipartite is trivial. Because there is no odd cycle
- Induction Step $k > 1$ :
  - Suppose first that $K_n = G_1 \cup G_2 \cup ... \cup G_k$, where each $G_i$ is bipartite.
  - We partition the vertex set into two sets X, Y such that $G_k$ has no edge within X or within Y. 
  - ***The union of the other k - 1 bipartite subgraphs must cover the complete subgraphs induced by X and by Y.***
  - Applying the induction hypothesis to each yields $|X| <= 2^{k-1}$ and $|Y| <= 2^{k-1}$, So $N <= 2^{K-1} + 2^{K-1} = 2^k$
- Conversely, suppose that $n <= 2^{k-1}$.
  - We partition the vertex set into subsets X, Y, each of size at most $2^{k-1}$ 
  - By induction hypothesis, we can cover the complete subgraph induced by either subset with k - 1 bipartite subgraphs.
  - The union of i-th such subgraph on X with the i-th such subgraph on Y is a bipartite graph.
  - Hence we obtain k - 1 bipartite graphs whose union consists of the complete subgraphs induced by X and Y.
  - The remaining edges are those of the biclique with bipartition X, Y. Letting this be the kth bipartite subgraph completes the construction.

[The complete graph $K_n$  can be expressed as the union of *k*  bipartite graphs iff *n*≤$2^k$](https://math.stackexchange.com/questions/2336855/the-complete-graph-k-n-can-be-expressed-as-the-union-of-k-bipartite-graphs-i)

## Eulerian circuit

### Topology review

- Path : Sequence of edges
- Circuit : Path which has same start point and end point 
- Cycle : Circuit which doesn't have repeated vertices
  - Path which has same start point, end point and doesn't have repeated vertices
- Trail : A walk which doesn't have repeated edges

### Definition of Eulerian

- A graph is ***Euler*** if it has a closed trail containing all edges. 
  (중복 없이 closed edges 가지면 오일러 그래프 - 한붓그리기)
- Eulerian circuit or Eulerian trail in a graph is a circuit or trail containing all the edges
  - Even graph : A graph with ***vertex degrees all even***
  - Odd graph : A graph with ***vertex degrees all odd***
- ***Maximal path(Lemma)*** : If graph is finite, then maximal paths exist.

#### Lemma : If every vertex of a graph G has degree at least 2, then G contains a cycle

- In maximal path, each vertex's in & out, edge of start vertex and end vertex. Therefore each vertex has 2 edges and there is a cycle.

#### Theorem : A graph G is Eulerian

- Nontrivial : any connected~

- Theorem : A graph G is Eulerian iff it has at most one nontrivial component and its vertices all have even degree

- Necessity

  - Suppose that G has an Eulerian circuit C.
  - Each passage of C through a vertex uses two incident(부속) edges, and the first edge is paired with the last at the first vertex
  - Hence every vertex has even degree. Also, two edges can be in the same trail only when they lie in the same component, so there is at most one nontrivial component

- Sufficient

  - Assuming We obtain an Eulerian circuit(circuit : 시작점과 종료점이 같음) using induction on ***the number of edges, m.***
    (시작점과 종료점이 같으려면 degree of vertex is even)

  - Basic step : m = 0, A closed trail consisting of one vertex suffices.

  - Induction step :

    - m > 0. With even degrees, each vertex in the nontrivial component of G has degree at least 2. 
    - We know that when vertex has at least 2 degree, then graph contains a cycle(lemma)
      - Therefore, the nontrivial component has a cycle C.
    - Let G' be the graph obtained from G by deleting E(C)
    - Since C has 0 or 2 edges at each vertex, each component of G' is also an even graph.
    - Since each component also is connected and has fewer than m edges, ***we can apply the induction hypothesis to conclude that each component of G' has an Eulerian circuit.***
      - 오일러 써킷(G)이 포함하는 임의의 싸이클 중 하나의 싸이클이 가진 edges 제거하고 남은 그래프 역시 오일러 써킷인가?를 확인

    - To combine these into an Eulerian circuit of G, We traverse C, but when a component of G' is entered for the first time we detour along an Eulerian circuit of that component.
    - This circuit ends at the vertex where we began the detour. When we complete the traversal of C, we have completed an Eulerian circuit of G.
Inductive Closure Problem

a.k.a. How to decompose a problem into sub-problems ?

With any naive approach solving a n variables problem needs approximately 2^n operations. Decomposing is based on the idea that its easier to solve two problems on (n/2) variable than one on n.

A simple initial approach of this problem can be modelized using a graph G = (V, E) (with V being a set of vertices and E a set of edges) and a suppression function S(G, X) (with X a subset of V). S returns a new graph with the vertices of X being removed and edges added between every neighbor of the nodes of in X.

Let X be a subset of V, we define the neighborhood N(X) of X by N(X) = {x\in V, \exists y \in X, {x, y} \in E }. Thus X is a subset of N(X). We define the strict neighborhood NN(X) of X by NN(X) = N(X) \ X (i.e. the neighbors of X which are not X).

We denote S(G, X) = (V \ X, (E(N(X)^2)) U (NN(X) ^2) ), i.e. the graph G with the vertices in X (and their related edges) being removed. And a clique (complete graph) added between the vertices composing the strict neighborhood of X in G.

We define the cost of S(G, X) as 2^(# N(X)), i.e. two at the power the number of vertices within the neighborhood of X. We define SS(G, X1, ..., X(k-1), Xk) = S(SS(G, X1, ..., X(k-1)), Xk) and SS(G) = G We define the cost of SS as the sum of the cost of application of each S. We say that a sequence X1, ..., Xk suppress G iff SS(G, X1, ..., Xk) is the empty graph. Goal: find a sequence of minimal cost which suppresses G.


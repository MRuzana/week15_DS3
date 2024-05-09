
class Graph {
  Map<int, List<int>> adjacencyList={};

  Graph() {
    adjacencyList = {};
  }

  void addVertex(int vertex) {
    adjacencyList[vertex] = [];
  }

  void addEdge(int source, int destination) {
    adjacencyList[source]!.add(destination);
    // For undirected graph, add the reverse edge as well
    // adjacencyList[destination].add(source);
  }

  List<int> dfs(int startVertex) {
    List<int> visited = [];
    List<int> stack = [];

    stack.add(startVertex);

    while (stack.isNotEmpty) {
      int currentVertex = stack.removeLast();
      if (!visited.contains(currentVertex)) {
        visited.add(currentVertex);
        List<int> neighbors = adjacencyList[currentVertex]!;
        for (int neighbor in neighbors) {
          stack.add(neighbor);
        }
      }
    }

    return visited;
  }
}

void main() {
  Graph graph = Graph();

  // Add vertices
  graph.addVertex(0);
  graph.addVertex(1);
  graph.addVertex(2);
  graph.addVertex(3);
  graph.addVertex(4);
  graph.addVertex(5);

  // Add edges
  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 4);
  graph.addEdge(3, 5);
  graph.addEdge(4, 5);

  // Perform DFS starting from vertex 0
  List<int> dfsResult = graph.dfs(0);
  print('DFS traversal result: $dfsResult');
}
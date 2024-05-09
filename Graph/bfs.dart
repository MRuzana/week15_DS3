class Graph {
  Map<int, List<int>> map={};

  Graph() {
    map = {};
  }

  void addVertex(int data) {
    map[data] = [];
  }

  void addEdge(int source, int destination) {
    map[source]!.add(destination);
    // For undirected graph, add the reverse edge as well
    // adjacencyList[destination].add(source);
  }

  List<int> bfs(int startVertex) {
    List<int> visited = [];
    List<int> queue = [];

    visited.add(startVertex);
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeAt(0);
      List<int> neighbors = map[currentVertex]!;

      for (int neighbor in neighbors) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
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

  // Perform BFS starting from vertex 0
  List<int> bfsResult = graph.bfs(0);
  print('BFS traversal result: $bfsResult');
}


class Graph<T>{
  Map<T,List<T>> map={};
  // Map<int, List<int>> maps={};

  void addVertex(T data){
    map[data]=[];
  }
  void insert(T vertex,T edge,bool bidirectional){
    if(!map.containsKey(vertex)){
      addVertex(vertex);
    }
    if(!map.containsKey(edge)){
      addVertex(edge);
    }
    map[vertex]!.add(edge);
    if(bidirectional){
      map[edge]!.add(vertex);
    }
  }
  void display(){
   map.entries.forEach((element) { 
    print('${element.key} : ${element.value}');
   });
  }

 
}
void main(){
  Graph<String> graph=Graph<String>();
  graph.insert('A', 'B', true);
  graph.insert('B', 'C', true);
  graph.insert('C', 'D', false);
  graph.display();

 
}
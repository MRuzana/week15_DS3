class RiverGraph{

  List<int>CheckRiverSize(List<List<int>>matrix){
    List<List<bool>> visited = List.generate(matrix.length, (_) => List.filled(matrix[0].length, false));
    List<int>sizes=[];
    
    for(int i=0;i<matrix.length;i++){
      for(int j=0;j<matrix[0].length;j++){
        if(visited[i][j]){
          continue;
        }
        else{
          traverseRiver(i, j, matrix, visited, sizes);
        }
      }
    }
    return sizes;
  }
  void traverseRiver(int i,j,List<List<int>>matrix,List<List<bool>>visited,List<int>sizes){
    int currentRiverSize=0;
    List<List<int>> nodesToExplore = [];
    nodesToExplore.add([i,j]);

    while(!nodesToExplore.isEmpty){
      List<int>currentNoode= nodesToExplore.removeLast();
      i=currentNoode[0];
      j=currentNoode[1];
       if(visited[i][j]){
        continue;
      }
      visited[i][j]=true;
      if(matrix[i][j] == 0){
        continue;
      }
      currentRiverSize++;
      List<List<int>>nearest = getNearestNodes(i,j,matrix,visited);
      nodesToExplore.addAll(nearest);
    }
    if(currentRiverSize>0){
      sizes.add(currentRiverSize);
    }
  }

  List<List<int>> getNearestNodes(int i,int j,List<List<int>>matrix,List<List<bool>>visited){
    List<List<int>>nearest=[];

    if(i>0 && !visited[i-1][j]){
      nearest.add([i-1,j]);
    }
    if(i< matrix.length-1 && !visited[i+1][j]){
      nearest.add([i+1,j]);
    }
    if(j>0 && !visited[i][j-1]){
      nearest.add([i,j-1]);
    }
     if(j< matrix[0].length-1 && !visited[i][j+1]){
      nearest.add([i,j+1]);
    }
    return nearest;
  }
}
void main(){
  List<List<int>>matrix=[ [1,0,0,1,1],
                          [0,1,1,1,0],
                          [0,0,0,0,1],
                          [1,0,0,0,1] ];
  RiverGraph graph=RiverGraph();
  List<int>result= graph.CheckRiverSize(matrix);
  print(result);
}
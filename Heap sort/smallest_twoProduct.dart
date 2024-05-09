class MinHeap{
  List<int>heap=[];
  MinHeap(List<int>array){
    buildHeap(array);
  }

  void buildHeap(List<int>array){
    heap=array;
    for(int i=parent(heap.length-1);i>=0;i--){
      shiftDown(i);
    }
  }

  void shiftDown(int currentIndex){
    int endIndex=heap.length-1;
    int leftindex=leftChild(currentIndex);
    while(leftindex <= endIndex){
      int rightIndex=rightChild(currentIndex);
      int indexToShift;

      if(rightIndex <=endIndex && heap[rightIndex] < heap[leftindex]){
        indexToShift=rightIndex;
      }
      else{
        indexToShift=leftindex;
      }

      if(heap[currentIndex] > heap[indexToShift]){
        swap(currentIndex, indexToShift);

        currentIndex=indexToShift;
        leftindex=leftChild(currentIndex);
      }
      else{
        return;
      }
    }

  }
  void shiftUp(int currentIndex){
    int parentIndex=parent(currentIndex);
    while(currentIndex > 0 && heap[parentIndex] > heap[currentIndex]){
      swap(currentIndex, parentIndex);
       currentIndex=parentIndex;
       parentIndex=parent(currentIndex);
    }
  }
  void insert(int value){
    heap.add(value);
    shiftUp(heap.length-1);
    
  }
  void remove(){
    if(heap.isEmpty)return;
    swap(0,heap.length-1);
    heap.removeLast();
    shiftDown(0);
  }
  void swap(i,j){
    var temp=heap[i];
    heap[i]=heap[j];
    heap[j]=temp;
  }
  int peek(){
    return heap[0];
  }
  int parent(int i){
    return (i-1)~/2;
  }
  int leftChild(int i){
    return (2*i+1);
  }
  int rightChild(int i){
    return (2*i+2);
  }
  void display(){
    print(heap);
  }

}
void main(){
  List<int>array=[6,2,8,3,7,9];
  MinHeap heap=MinHeap(array);
  heap.display();

  List<int>sortedlist=[];
  while(heap.heap.isNotEmpty){
    sortedlist.add(heap.peek());
    heap.remove();
  }
  print('sortedlist = $sortedlist');
  print('product of two smallest= ${sortedlist[0]*sortedlist[1]}');
}
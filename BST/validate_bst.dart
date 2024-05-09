class Node{
  dynamic data;
  Node? left;
  Node? right;
  Node(this.data);
}
class BinarySearchTree{
  Node? root;

  void insert(dynamic data){
    Node? currentNode=root;
    Node newNode=Node(data);
    if(currentNode==null){
      root=newNode;
      return;
    }
    while(true){
      if(data < currentNode!.data){
        if(currentNode.left==null){
          currentNode.left=newNode;
          break;
        }
        else{
          currentNode=currentNode.left;
        }
      }
      else if(data > currentNode.data){
        if(currentNode.right==null){
          currentNode.right=newNode;
          break;
        }
        else{
          currentNode=currentNode.right;
        }
      }
    }
  }
  void inOrder(){
    List<int>nodeList=[];
    inOrderHelper(root,nodeList);
    String result = validateBst(nodeList);
    print(result);
  }
  void inOrderHelper(Node? currentNode,List<int>nodeList){
    if(currentNode!=null){
      inOrderHelper(currentNode.left, nodeList);
      nodeList.add(currentNode.data);
      inOrderHelper(currentNode.right, nodeList);
    }
  }
  String validateBst(List<int>nodeList){
    for(int i=1;i<nodeList.length;i++){
      if(nodeList[i] < nodeList[i-1]){
        return 'Not a BST';
      }
    }
    return 'Its a BST';
  }
}

void main(){
  BinarySearchTree tree=BinarySearchTree();
  tree.insert(10);
  tree.insert(8);
  tree.insert(11);
  tree.insert(4);
  tree.insert(9);

  tree.inOrder();
}
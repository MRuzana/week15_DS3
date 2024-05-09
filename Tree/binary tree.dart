

class Node{
  dynamic data;
  Node? left;
  Node? right;
  Node(this.data);
}
class BinaryTree{
  Node? root;
  // void insert(dynamic data){
  //   Node? currentNode=root;
  //   Node newnode=Node(data);

  //   if(currentNode==null){
  //     root=newnode;
  //     return;
  //   }
  //   while(true){
  //     if(data < currentNode!.data){
  //       if(currentNode.left==null){
  //         currentNode.left=newnode;
  //         break;
  //       }
  //       else{
  //         currentNode = currentNode.left;
  //       }
  //     }
  //     else if(data > currentNode.data){
  //       if(currentNode.right==null){
  //         currentNode.right=newnode;
  //         break;
  //       }
  //       else{
  //         currentNode = currentNode.right;
  //       }
  //     }
  //   }
    
  // }
  void insert(dynamic data){
    Node? currentnode=root;
    Node newnode=Node(data);
    if(currentnode==null){
      root=newnode;
      return;
    }
    while(true){
      if(currentnode!.left==null){
        currentnode.left=newnode;
        break;
      }

      else if(currentnode.right==null){
        currentnode.right=newnode;
        break;
      }
      else{
        currentnode=currentnode.left;
      }
    }

  }

  void inOrder(){
    List<int>nodeList=[];
    inOrderHelper(root,nodeList);
    print(nodeList.join(' '));
  }
  void inOrderHelper(Node? currentNode,List<int>nodeList){
    
    if(currentNode!=null){
      inOrderHelper(currentNode.left,nodeList);
      nodeList.add(currentNode.data);
      inOrderHelper(currentNode.right,nodeList);
    }
  }
}
void main(){
  BinaryTree tree=BinaryTree();
  tree.insert(30);
  tree.insert(20);
  tree.insert(40);
  tree.insert(5);
  tree.insert(50);
  tree.insert(25);

  tree.inOrder();
}



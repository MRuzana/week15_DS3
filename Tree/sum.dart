class Node{
  dynamic data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinaryTree{
  Node? root;

  void insert(dynamic data){
    Node newNode=Node(data);
    Node? currentNode=root;

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


  int sum(){
    return sumHelper(root);
  }

  sumHelper(Node? currentNode){
    if(currentNode==null){
      return 0;
    }
    else{
      return currentNode.data + sumHelper(currentNode.left)+ sumHelper(currentNode.right);
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

  print('sum of all nodes = ${tree.sum()}');
}
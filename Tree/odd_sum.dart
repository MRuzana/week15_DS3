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

  void inOrder(){
    List<int>nodeList=[];
    inOrderHelper(root,nodeList);
    print(nodeList.join(' '));
  }

  List<int> inOrderHelper(Node? currentNode,List<int>nodeList){
    if(currentNode!=null){
      inOrderHelper(currentNode.left,nodeList);
      nodeList.add(currentNode.data);
      inOrderHelper(currentNode.right,nodeList);
    }
    return nodeList;
  }

  int oddSum(){
    return oddSumHelper(root);
  }
  int oddSumHelper(Node? currentNode){
    int sum=0;
    if(currentNode==null){
      return 0;
    }
    else{
      if(currentNode.data%2!=0){
       sum =sum+currentNode.data as int;
      }
      sum=sum+oddSumHelper(currentNode.left);
      sum=sum+oddSumHelper(currentNode.right);
       
    }
    return sum;
  }
}

void main(){
  BinaryTree tree=BinaryTree();
  tree.insert(20);
  tree.insert(10);
  tree.insert(30);
  tree.insert(5);
  tree.insert(11);

  tree.inOrder();

  print('sum of odd nodes = ${tree.oddSum()}');

}
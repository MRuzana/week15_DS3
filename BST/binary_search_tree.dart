class Node{
  dynamic data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinarySearchTree{

  Node? root;

  void insert(dynamic data){
    Node newNode=Node(data);
    Node? currentNode = root;

    if(currentNode==null){
      root=newNode;
      return;
    }
    while(true){
      if(data < currentNode!.data){
        if(currentNode.left==null){
          currentNode.left = newNode;
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

  bool contains(dynamic data){
    Node? currentNode=root;
    while(currentNode!=null){
      if(data < currentNode.data){
        currentNode=currentNode.left;
      }
      else if(data > currentNode.data){
        currentNode=currentNode.right;
      }
      else{
        return true;
      }
    }
    return false;
  }

  void remove(dynamic data){
    removeHelper(data,root,null);
  }

  void removeHelper(dynamic data, Node? currentNode, Node? parentNode,){
    while(currentNode!=null){
      if(data < currentNode.data){
        parentNode=currentNode;
        currentNode=currentNode.left;
      }
      else if(data > currentNode.data){
        parentNode=currentNode;
        currentNode=currentNode.right;

      }
      /** if the value to be deleted have left and right childs */
      else{
        if(currentNode.left!=null && currentNode.right!=null){
          currentNode.data=getMinValue(currentNode.right);
          removeHelper(currentNode.data, currentNode.right, currentNode);

        }
        else {
          if(parentNode==null){
            if(currentNode.right==null){
              root=currentNode.left;
            }
            else{
              root=currentNode.right;
            }
          }
          else{
            if(parentNode.left==currentNode){
              if(currentNode.right==null){
                parentNode.left=currentNode.left;
              }
              else{
                parentNode.left=currentNode.right;
              }
            }
            else{
              if(currentNode.right==null){
                parentNode.right=currentNode.left;
              }
              else{
                parentNode.right=currentNode.right;
              }

            }
          }
        }
        break;

      }
    }

  }

  int getMinValue(Node? currentNode){
    if(currentNode!.left == null){
      return currentNode.data;
    }
    else{
      return getMinValue(currentNode.left);
    }
    
  }

   inOrder(){
    List<int>nodeList=[];
    inOrderHelper(root,nodeList);
    print('In order traversal = ${nodeList.join(' ')}');
  }
  void inOrderHelper(Node? node,List<int>nodeList){
    
    if(node!=null){
      inOrderHelper(node.left,nodeList);
      nodeList.add(node.data);
      inOrderHelper(node.right,nodeList);
    }
  }

  void preOrder(){
    List<int>nodeList=[];
    preOrderHelper(root,nodeList);
    print('Pre order traversal = ${nodeList.join(' ')}');
  }
  void preOrderHelper(Node? node,List<int>nodeList){
     if(node!=null){
      nodeList.add(node.data);
      preOrderHelper(node.left,nodeList);
      preOrderHelper(node.right,nodeList);
    }
  }

  void postOrder(){
    List<int>nodeList=[];
    postOrderHelper(root,nodeList);
    print('Post order traversal = ${nodeList.join(' ')}');
  }
   void postOrderHelper(Node? node,List<int>nodeList){
     if(node!=null){
      
      postOrderHelper(node.left,nodeList);
      postOrderHelper(node.right,nodeList);
      nodeList.add(node.data);
    }
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
  tree.preOrder();
  tree.postOrder();

  print(tree.contains(8));
  tree.remove(8);
  tree.inOrder();
}

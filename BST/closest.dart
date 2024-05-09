class Node {
  dynamic data;
  Node? right;
  Node? left;
  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  void insert(dynamic data) {
    Node? currentNode = root;
    Node newNode = Node(data);

    if (currentNode == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < currentNode!.data) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else if (data > currentNode.data) {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          break;
        } else {
          currentNode = currentNode.right;
        }
      }
    }
  }

  void postOrderTraversal() {
    List<int> nodeList = [];
    postOrderHelper(root, nodeList);
    print('postorder traversal = ${nodeList.join(' ')}');
  }

  void postOrderHelper(Node? currentNode, List<int> nodeList) {
    if (currentNode != null) {
      postOrderHelper(currentNode.left, nodeList);
      postOrderHelper(currentNode.right, nodeList);
      nodeList.add(currentNode.data);
    }
  }

  int closest(int target) {
    Node? currentNode = root;
    int closest = currentNode!.data;
    while (currentNode != null) {
      if ((target - closest).abs() > (target - currentNode.data).abs()) {
        closest = currentNode.data;
      }
      if (target < closest) {
        currentNode = currentNode.left;
      } else if (target > closest) {
        currentNode = currentNode.right;
      } else {
        break;
      }
    }
     return closest;
  }

}

void main() {
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(30);
  tree.insert(20);
  tree.insert(40);
  tree.insert(10);
  tree.insert(25);

  tree.postOrderTraversal();
  print('closest = ${tree.closest(10)}');
}

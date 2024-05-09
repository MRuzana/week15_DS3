class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (!node.children.containsKey(letter)) {
        node.children[letter] = TrieNode();
      }
      node = node.children[letter]!;
    }
    node.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (!node.children.containsKey(letter)) {
        return false;
      }
      node = node.children[letter]!;
    }
    return node.isEndOfWord;
  }

  void delete(String word) {
    _deleteHelper(root, word, 0);
  }

  bool _deleteHelper(TrieNode node, String word, int depth) {
    if (depth == word.length) {
      if (!node.isEndOfWord) return false;
      node.isEndOfWord = false;
      return node.children.isEmpty;
    }

    String letter = word[depth];
    if (!node.children.containsKey(letter)) return false;

    bool shouldDeleteCurrentNode = _deleteHelper(node.children[letter]!, word, depth + 1);

    if (shouldDeleteCurrentNode) {
      node.children.remove(letter);
      return node.children.isEmpty;
    }

    return false;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("apple");
  trie.insert("app");
  trie.insert("application");
  trie.insert("banana");

  print(trie.search("application")); 
  trie.delete("application");
  print(trie.search("application")); 
}
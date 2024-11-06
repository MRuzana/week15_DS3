class TrieNode{
  Map<String,TrieNode> children={};
}
class Trie{
  TrieNode root=TrieNode();
  String endSymbol='*';
  Trie(String str){
    populateSuffixTree(str);
  }

  void populateSuffixTree(String str){
    for(int i=0;i<str.length;i++){
      insertSubstringStartingAt(i,str);
    }
  }
  void insertSubstringStartingAt(int index,String str){
    TrieNode node=root;
    TrieNode newNode=TrieNode();
    for(int i=0;i<str.length;i++){
      String letter=str[i];
      if(!node.children.containsKey(letter)){
        node.children[letter]=newNode;
      }
      node=node.children[letter]!;
    }
    node.children[endSymbol]=TrieNode();
  }

  bool contains(String str){

    TrieNode node=root;
    for(int i=0;i<str.length;i++){
      if(!node.children.containsKey(str[i])){
        return false;
      }
      node=node.children[str[i]]!;
    }
    return node.children.containsKey(endSymbol);
  }
}
void main(){
  String str='application';
  Trie trie=Trie(str);
  print(trie.contains('pplication'));
}

/*

class TrieNode {
  Map<String, TrieNode> children = {}; // Holds child nodes
  bool isEndOfWord = false;            // Marks the end of a complete word
}

class Trie {
  TrieNode root = TrieNode();           // Root node of the Trie

  // Inserts a word into the Trie
  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (!node.children.containsKey(letter)) {
        node.children[letter] = TrieNode();
      }
      node = node.children[letter]!;
    }
    node.isEndOfWord = true; // Mark the end of the word
  }

  // Checks if the word exists in the Trie
  bool contains(String word) {
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

  // Checks if any word in the Trie starts with the given prefix
  bool startsWith(String prefix) {
    TrieNode node = root;
    for (int i = 0; i < prefix.length; i++) {
      String letter = prefix[i];
      if (!node.children.containsKey(letter)) {
        return false;
      }
      node = node.children[letter]!;
    }
    return true;
  }
}

void main() {
  Trie trie = Trie();
  
  // Insert words into the Trie
  trie.insert("hello");
  trie.insert("suriya");

  // Check if words are contained in the Trie
  print(trie.contains("hello")); // true
  print(trie.contains("suriya")); // true
  print(trie.contains("ello")); // false (since 'ello' is not a complete word)

  // Check if any words start with a given prefix
  print(trie.startsWith("hel")); // true
  print(trie.startsWith("sur")); // true
  print(trie.startsWith("df"));  // false
}

*/

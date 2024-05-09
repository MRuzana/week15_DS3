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
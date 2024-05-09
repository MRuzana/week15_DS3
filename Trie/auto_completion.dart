class TrieNode{
  Map<String,TrieNode> children={};
  bool isEndOfWord=false;
}
class Trie{
  TrieNode root=TrieNode();

  void insert(String str){
    TrieNode node=root;
    for(int i=0;i<str.length;i++){
      if(!node.children.containsKey(str[i])){
        node.children[str[i]]=TrieNode();
      }
      node=node.children[str[i]]!;
    }
    node.isEndOfWord=true;
  }

  autoCompletion(String str){
    TrieNode node=root;
    List<String>suggestions=[];
    for(int i=0;i<str.length;i++){
      String letter=str[i];
      if(!node.children.containsKey(letter)){
        return suggestions;
      }
      node=node.children[letter]!;
    }
    _collectWords(node,str,suggestions);
    return suggestions;
  }

  void _collectWords(TrieNode node,String str,List<String>suggestions){
    if(node.isEndOfWord){
      suggestions.add(str);
    }
    for(String letter in node.children.keys){
      _collectWords(node.children[letter]!, str+letter, suggestions);
    }
  }
}

void main(){

  Trie trie=Trie();
  trie.insert('application');
  trie.insert('app');
  trie.insert('applicat');
  trie.insert('apple');
  trie.insert('banana');
  print(trie.autoCompletion('app'));
}
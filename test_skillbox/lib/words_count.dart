class WordsCount {
  List words = ["кошка", "ящерица", "кошка", "корова", "кошка"]; // массив слов
  Map<String, int> result = {"": 0}; // слово = количество вхождений
}

getWordsCount() {
  var wordsCount = WordsCount();
  List words = wordsCount.words;
  Map<String, int> result = wordsCount.result;
  result.clear();

  for (int i = 0; i < words.length; i += 1) {
    String currentWord = words[i];
    int count = 0;
    for (int y = 0; y < words.length; y++) {
      if (currentWord == words[y]) {
        count = count + 1;
        result[words[y]] = count;
      }
    }
  }
  print("Сумма вхождений каждого слова в массиве '$words': $result");
  return result;
}

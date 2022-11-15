class WordIsInt {
  List words = [
    "one",
    "nine",
    "three",
    "cat",
    "dog",
    "nine",
    "frog",
    "two",
    "one"
  ]; // массив слов
  Map<int, String> wordsNumbers = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
  }; // словарь с цифрами и их текстовыми значениями
  List numbers = []; // массив с цифрами
  List numbersTemp = []; // массив для сравнения
}

getWordsCount() {
  var wordIsInt = WordIsInt();
  List words = wordIsInt.words;
  Map<int, String> wordsNumbers = wordIsInt.wordsNumbers;
  List numbers = wordIsInt.numbers;
  List numbersTemp = wordIsInt.numbersTemp;

  for (int i = 0; i < words.length; i++) {
    for (int y = 0; y < wordsNumbers.length; y++) {
      if (words[i] == wordsNumbers[y]) {
        int currentNumber = wordsNumbers.keys.firstWhere(
            (key) => wordsNumbers[key] == words[i],
            orElse: () => 0);
        numbersTemp.add(currentNumber);
      }
    }
  }
  numbers = numbersTemp;

  for (int i = 0; i < numbersTemp.length; i++) {
    if (numbersTemp[i] == numbers[i++]) {
      numbers.removeAt(i++);
    }
  }
  print("Числа из массива '$words': $numbers");
  return numbers;
}

class NumsFromStr {
  List<String> arrayFromStr = []; // массив со словами из текста
  List<num?> numArray = []; // массив с цифрами из текста
}

getNumsFromStr(String str) {
  var numsFromStr = NumsFromStr();
  List<String> arrayFromStr = numsFromStr.arrayFromStr;
  List<num?> numArray = numsFromStr.numArray;

  arrayFromStr = (str.split(" "));

  for (int i = 0; i < arrayFromStr.length; i += 1) {
    num? result = num.tryParse(arrayFromStr[i]);
    if (result != null) {
      numArray.add(result);
    }
  }
  print("Числа из предложения '$str': $numArray");
  return numArray;
}

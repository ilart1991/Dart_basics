// Dart imports:
import 'dart:math';

class BinaryDecimal {
  int a = 355; // число для перевода в/из двоичной системы
  List<int> binaryArray = []; // массив с 0/1
  String binary = ""; // двоичное число
  int b = 0; // остаток от деления
}

void getBinaryDecimal() {
  var binaryDecimal = BinaryDecimal();
  int a = binaryDecimal.a;
  List<int> binaryArray = binaryDecimal.binaryArray;
  String binary = binaryDecimal.binary;
  int b = binaryDecimal.b;

  for (a = a; a > 0; a ~/= 2) {
    b = a % 2;
    binaryArray.insert(0, b);
  }
  for (int i = 0; i < binaryArray.length; i += 1) {
    binary = binary + binaryArray[i].toString();
  }

  a = binaryDecimal.a;

  List<num> degrees = [];
  num decimal = 0;
  List<num> decimals = [];

  for (int i = binaryArray.length - 1; i > -1; i -= 1) {
    degrees.add(pow(2, i));
  }

  for (int i = 0; i < binaryArray.length; i += 1) {
    decimals.add(binaryArray[i] * degrees[i]);
  }

  for (int i = 0; i < decimals.length; i += 1) {
    decimal = decimal + decimals[i];
  }
  print(
      "Бинарное значение числа $a: $binary \n Число $binary в десятичной системе: $decimal");
}

class SimpleNumsNodNoc {
  int x = 1155; // первое число для рассчетов
  int y = 1325; // второе число для рассчетов

  List<int> simpleNumbersX = [];
  List<int> dividersX = [];
  List<int> dividersY = [];
}

getSimpleNumbers() {
  var simpleNumsNodNoc = SimpleNumsNodNoc();
  int x = simpleNumsNodNoc.x;
  List<int> simpleNumbersX = simpleNumsNodNoc.simpleNumbersX;
  int d = 1;

  if (x <= 0) {
    print("Аргумент X ($x) должен быть больше нуля");
    return;
  }

  for (int i = 2; x > 1; i += d) {
    while (x % i == 0) {
      x ~/= i;
      simpleNumbersX.add(i);
    }
    if (i == 3) {
      d = 2;
    }
  }

  x = simpleNumsNodNoc.x;
  print("Простые множители числа $x: $simpleNumbersX");
  return simpleNumbersX;
}

void getNodNok() {
  var one = SimpleNumsNodNoc();
  int x = one.x;
  int y = one.y;
  int nod = 0;
  int nok = 0;
  List<int> dividersX = one.dividersX;
  List<int> dividersY = one.dividersY;

  if (x <= 0 || y <= 0) {
    print("Аргументы X ($x) и Y ($y) должны быть больше нуля");
    return;
  }

  for (int i = 1; i < x + 1; i += 1) {
    if (x % i == 0) {
      dividersX.add(i);
    }
  }
  for (int i = 1; i < y + 1; i += 1) {
    if (y % i == 0) {
      dividersY.add(i);
    }
  }
  print("Делители числа $x: $dividersX \n Делители числа $y: $dividersY");

  for (int i = 0; i < dividersX.length; i += 1) {
    for (int y = 0; y < dividersY.length; y += 1) {
      if (dividersX[i] == dividersY[y]) {
        nod = dividersX[i];
      }
    }
  }

  nok = x * y ~/ nod;
  print("НОД $x и $y: $nod \n НОК $x и $y: $nok");
}

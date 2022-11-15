num printNumber = 0; // число для вывода
num printDegree = 0; // степень корня для вывода
int counter = 0; //число итераций
int limitCount = 10000000; // ограничение итераций

extension on num {
  num gotMySqrt(num number, num degree) {
    printNumber = number;
    printDegree = degree;
    num circa = 0.00007; // погрешность
    num result = number / degree; // приближение корня
    num numberTemp = number; // дубль для расчета

    while (forOperation(result - numberTemp) >= circa) {
      numberTemp = number;
      for (int i = 1; i < degree; i++) {
        numberTemp = numberTemp / result;
      }
      result = 0.5 * (numberTemp + result);
      counter++;

      if (counter > limitCount) {
        print(
            "Измените параметры запроса или повысьте лимит по количеству итераций");
        return counter = 0;
      }
    }
    return result;
  }
}

num forOperation(num x) {
  if (x < 0) {
    return -x;
  } else {
    return x;
  }
}

void getSqrt(num number, num degree) {
  try {
    num sqrt = 0.gotMySqrt(number, degree);
    print(
        "Корень $printDegree степени из $printNumber = ${sqrt.toStringAsFixed(2)}. Итераций: $counter");
  } catch (e) {
    print("Ошибка: $e");
  }
}

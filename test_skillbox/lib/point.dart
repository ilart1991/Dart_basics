// Dart imports:
import 'dart:math';

enum PointType {
  zero,
  unitVector,
}

class Point {
  factory Point(PointType type) {
    switch (type) {
      case PointType.zero:
        print("Начало координат: ${_Zero().type}");
        return _Zero();
      case PointType.unitVector:
        print("Единичный вектор: ${_UnitVector().type}");
        return _UnitVector();
    }
  }
  Map<String, int> get type => {};
}

class _Zero implements Point {
  @override
  Map<String, int> get type => {"x": 0, "y": 0, "z": 0};
}

class _UnitVector implements Point {
  @override
  Map<String, int> get type => {"x": 1, "y": 1, "z": 1};
}

distanceTo(Map<String, double> pointOne, pointTwo) {
  double d = sqrt(pow((pointTwo["x"]! - pointOne["x"]!), 2) +
      pow((pointTwo["y"]! - pointOne["y"]!), 2) +
      pow((pointTwo["z"]! - pointOne["z"]!), 2));
  print("Расстояние между точками $pointOne и $pointTwo: $d");
  return d;
}

square(Map<String, int> pointOne, pointTwo, pointThree) {
  int sideA = getSideSize(pointTwo, pointOne); // сторона А
  int sideB = getSideSize(pointThree, pointOne); // сторона B
  int sideC = getSideSize(pointThree, pointTwo); // сторона C
  double p = (sideA + sideB + sideC) / 2; // полупериметр
  double s = sqrt(
      p * ((p - sideA) * (p - sideB) * (p - sideC))); // площадь треугольника
  print("Площадь треугольника со сторонами $sideA, $sideB и $sideC: $s");
  return s;
}

getSideSize(Map<String, int> arg2, arg1) {
  return sqrt(pow((arg2["x"]! - arg1["x"]!), 2) +
          pow((arg2["y"]! - arg1["y"]!), 2) +
          pow((arg2["z"]! - arg1["z"]!), 2))
      .round();
}

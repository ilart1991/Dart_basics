// homework 1

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'binary_decimal.dart' as ex_two;
import 'nums_from_str.dart' as ex_three;
import 'point.dart' as ex_six;
import 'simple_nums_nod_nok.dart' as ex_one;
import 'sqrt.dart' as ex_seven;
import 'user.dart' as ex_eight;
import 'word_is_int.dart' as ex_five;
import 'words_count.dart' as ex_four;

// homework 2

void main() {
  // homework 1
  // Задание 1
  print("Задание 1");
  ex_one.getSimpleNumbers(); // возврат простых множителей
  ex_one.getNodNok(); // возврат НОД и НОК

  // Задание 2
  print("Задание 2");
  ex_two.getBinaryDecimal(); // преобразование систем счисления

  // Задание 3
  print("Задание 3");
  ex_three.getNumsFromStr(
      "В аквариуме у Харитона 45 раков, 5 щук да 32 тритона"); // вывод чисел из строки

  // Задание 4
  print("Задание 4");
  ex_four.getWordsCount(); // вывод слова и количества его вхождений

  // Задание 5
  print("Задание 5");
  ex_five.getWordsCount(); // вывод массива с числами из массива со строками

  // Задание 6
  print("Задание 6");
  ex_six.distanceTo({"x": 27, "y": 10, "z": 5},
      {"x": 5, "y": 5, "z": 15}); // возврат расстояния между точками
  ex_six.square({"x": 27, "y": 10, "z": 5}, {"x": 5, "y": 5, "z": 15},
      {"x": 15, "y": 15, "z": 20}); // возврат площади треугольника
  ex_six.Point zero =
      ex_six.Point(ex_six.PointType.zero); // возврат начала координат
  ex_six.Point unitVector =
      ex_six.Point(ex_six.PointType.unitVector); // возврат единичного вектора

  // Задание 7
  print("Задание 7");
  ex_seven.getSqrt(132, 6); // вывод корня n-степени из числа

  // Задание 8
  print("Задание 8");
  final user1 =
      ex_eight.AdminUser("admin@ya.ru"); // юзер-админ для добавления в массив
  final user2 =
      ex_eight.GeneralUser("tralala@mail.ru"); // юзер для добавления в массив
  final user3 =
      ex_eight.GeneralUser("gogo@list.ru"); // юзер для добавления в массив
  final user4 =
      ex_eight.GeneralUser("foo@gmail.com"); // юзер для добавления в массив
  final user5 =
      ex_eight.GeneralUser("cranck@bk.ru"); // юзер для добавления в массив

  final userManager = ex_eight.UserManager();

  List users = [user1, user2, user3, user4, user5];

  for (int i = 0; i < users.length; i++) {
    if (users[i].runtimeType == ex_eight.AdminUser) {
      userManager.addUser(ex_eight.AdminUser(users[i].getMailSystem));
    } else {
      userManager.addUser(users[i]);
    }
  }

  userManager.getUserListFinal();
  print(
      "Пользователи ${userManager.finalUserList}"); // пользователи со скрытым admin

  final userForDel = users[0]; // пользователь для удаления
  userManager.deleteUser(userForDel);
  print("После удаления ${userForDel.email}: ${userManager.finalUserList}");

  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );

  // homework 2
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<Widget> images = [
    Image.asset("assets/images/image1.jpg"),
    Image.asset("assets/images/image2.jpg"),
    Image.asset("assets/images/image3.jpg")
  ];

  @override
  String svgPath = "assets/images/leaf.svg";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 200,
              height: 200,
            ),
            CarouselSlider(
                items: images,
                options: CarouselOptions(
                    height: 100,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 1))),
          ],
        ),
      ),
    );
  }
}

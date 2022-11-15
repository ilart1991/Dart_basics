import 'simple_nums_nod_nok.dart' as ex_one;
import 'binary_decimal.dart' as ex_two;
import 'nums_from_str.dart' as ex_three;
import 'words_count.dart' as ex_four;
import 'word_is_int.dart' as ex_five;
import 'point.dart' as ex_six;
import 'sqrt.dart' as ex_seven;
import 'user.dart' as ex_eight;

void main() {
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
      ex_eight.AdminUser("tralala@mail.ru"); // юзер для добавления в массив
  final user2 =
      ex_eight.GeneralUser("admin@ya.ru"); // юзер для добавления в массив
  final user3 =
      ex_eight.GeneralUser("gogo@list.ru"); // юзер для добавления в массив
  final user4 =
      ex_eight.GeneralUser("foo@gmail.com"); // юзер для добавления в массив
  final user5 =
      ex_eight.GeneralUser("cranck@bk.ru"); // юзер для добавления в массив

  final userManager = ex_eight.UserManager();

  userManager.addUser(user1);
  userManager.addUser(user2);
  userManager.addUser(user3);
  userManager.addUser(user4);
  userManager.addUser(user5);

  print(userManager.getUserList); // пользователи в массиве
  userManager.getUserListFinal();
  print(userManager.finalUserList); // пользователи со скрытым admin

  final userForDel =
      ex_eight.AdminUser(user4.email); // пользователь для удаления
  userManager.deleteUser(userForDel);
  print("После удаления ${userForDel.email}: ${userManager.getUserList}");
  print("После удаления ${userForDel.email}: ${userManager.finalUserList}");
}

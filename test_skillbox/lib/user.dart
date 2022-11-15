class User {
  final String email;
  User(this.email);
}

class AdminUser extends User with mail {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(super.email);
}

mixin mail on User {
  String get getMailSystem => email.split("@").last;
}

class UserManager<T extends User> {
  List<String> usersList = [];
  List<String> finalUserList = [];

  addUser(T user) {
    usersList.add(user.email);
  }

  void deleteUser(T user) {
    usersList.remove(user.email);

    if (user.email.contains("admin")) {
      for (int i = 0; i < finalUserList.length; i++) {
        if (!finalUserList[i].contains("@")) {
          finalUserList.removeAt(i);
        }
      }
    } else {
      finalUserList.remove(user.email);
    }
  }

  String get getUserList => usersList.toString();

  void getUserListFinal() {
    for (int i = 0; i < usersList.length; i++) {
      if (usersList[i].split("@").first == "admin") {
        finalUserList.add(usersList[i].split("@").last);
      } else {
        finalUserList.add(usersList[i]);
      }
    }
  }
}

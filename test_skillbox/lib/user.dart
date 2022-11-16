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

  void addUser(T user) {
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

  void getUserListFinal() {
    for (int i = 0; i < usersList.length; i++) {
      if (usersList[i] == AdminUser(usersList[i]).getMailSystem) {
        finalUserList.add(usersList[i].split("@").last);
      } else {
        finalUserList.add(usersList[i]);
      }
    }
  }
}

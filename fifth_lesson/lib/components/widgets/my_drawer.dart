import 'package:flutter/material.dart';
import 'package:fifth_lesson/components/widgets/containers/etc/variables_for_widgets.dart';

Drawer myDrawer = Drawer(
  child: Column(
    children: [
      DrawerHeader(
        child: CircleAvatar(radius: 60, backgroundImage: NetworkImage(imgUrl)),
      ),
      drawerList,
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.lightBlue,
                onPressed: () {
                  print("object");
                },
                child: const Text(
                  "Выход",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              MaterialButton(
                color: Colors.lightBlue,
                onPressed: () {
                  print("object");
                },
                child: const Text("Регистрация",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      )
    ],
  ),
);

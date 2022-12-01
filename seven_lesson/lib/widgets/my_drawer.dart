import 'package:flutter/material.dart';
import 'package:seven_lesson/parts/vars.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: drawerItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: currentIndex == index ? Colors.blue : Colors.transparent,
            textColor: currentIndex == index ? Colors.white : Colors.black,
            leading: drawerItems.values.elementAt(index),
            title: Text(drawerItems.keys.elementAt(index)),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              currentIndex = index;
              Navigator.pop(context);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(('/home'), (route) => false);
              if (index == 0) {
                Navigator.pushNamed(context, "home");
              } else if (index == 1) {
                Navigator.pushNamed(context, "artists").then((value) {
                  currentIndex = 0;
                });
              }
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fifth_lesson/components/widgets/containers/etc/variables_for_widgets.dart';
import 'containers/etc/my_home_page_state.dart';

class MyBottomNavBar extends StatefulWidget {
  final Function() notifyParent;

  MyBottomNavBar({super.key, required this.notifyParent});
  @override
  MyBottomNavBarState createState() => MyBottomNavBarState();
}

class MyBottomNavBarState extends State<MyBottomNavBar> {
  onItemTapped(BuildContext context, int index) {
    setState(() {
      currentIndex = index;
      print(currentIndex);
      widget.notifyParent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      backgroundColor: Colors.lightGreen,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => onItemTapped(context, value),
    );
  }
}

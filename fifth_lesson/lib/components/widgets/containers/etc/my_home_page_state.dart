import 'package:flutter/material.dart';
import 'package:fifth_lesson/components/widgets/containers/etc/my_home_page.dart';
import 'package:fifth_lesson/components/widgets/containers/etc/variables_for_widgets.dart';
import 'package:fifth_lesson/components/widgets/my_app_bar.dart';
import 'package:fifth_lesson/components/widgets/my_end_drawer.dart';
import 'package:fifth_lesson/components/widgets/my_drawer.dart';
import 'package:fifth_lesson/components/widgets/my_bottom_nav_bar.dart';
import 'package:fifth_lesson/components/widgets/my_fab.dart';

class MyHomePageState extends State<MyHomePage> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: myAppBar,
          endDrawer: myEndDrawer,
          drawer: myDrawer,
          bottomNavigationBar: MyBottomNavBar(
            notifyParent: () {
              refresh();
            },
          ),
          body: Center(child: barContent.elementAt(currentIndex)),
          floatingActionButton: MyFab(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }
}

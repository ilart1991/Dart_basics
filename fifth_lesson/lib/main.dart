import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());

  // Future(() {
  //   scheduleMicrotask(() => print("before loop 1"));
  //   print("in event loop");
  //   PaintingBinding.instance.imageCache
  //       .evict("https://pbs.twimg.com/media/Eooss15XUAE2Ed8.jpg");
  // });
}

mixin CachedNetworkImage {
  static evictFromCache(String url) {}
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.photo_album_rounded), label: "Photo"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.chat_rounded), label: "Chat"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_box_rounded), label: "Profile")
  ];

  static const List<Widget> _barContent = <Widget>[
    Text(
      'PHOTO',
    ),
    Text(
      'CHAT',
    ),
    Text(
      'PROFILE',
    ),
  ];

  static Map<String, Icon> drawerItems = {
    "Home": const Icon(Icons.home),
    "Profile": const Icon(Icons.person),
    "Images": const Icon(Icons.image)
  };
  ListView test = ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: drawerItems.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: drawerItems.values.elementAt(index),
        title: Text('${drawerItems.keys.elementAt(index)}'),
        trailing: const Icon(Icons.arrow_right),
      );
    },
  );

  int currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      switch (currentIndex) {
        case 0:
          const Text("wdscsdcsdc");
          break;
      }
      print(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
            title: Text(widget.title),
            bottom: const TabBar(tabs: [
              Tab(
                text: "First",
              ),
              Tab(
                text: "Second",
              ),
              Tab(
                text: "Third",
              )
            ]),
          ),
          endDrawer: Drawer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "http://www.rosphoto.com/images/u/articles/1510/7_5.jpg")),
                  Text("Артем Ильинский"),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(
                  child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "http://www.rosphoto.com/images/u/articles/1510/7_5.jpg")),
                ),
                test,
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.all(18),
                        color: Colors.lightBlue,
                        onPressed: () {
                          print("object");
                        },
                        child: Text(
                          "Выход",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      MaterialButton(
                        padding: EdgeInsets.all(18),
                        color: Colors.lightBlue,
                        onPressed: () {
                          print("object");
                        },
                        child: Text("Регистрация",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            currentIndex: currentIndex,
            onTap: _onItemTapped,
          ),
          body: Center(child: _barContent.elementAt(currentIndex)),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                print("tapped");
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                          height: 180,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: const Icon(Icons.person),
                                      alignment: Alignment.topLeft,
                                    )),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: const Text("Сумма"),
                                        )),
                                    Expanded(
                                        child: Container(
                                      child: const Text(
                                        "200 руб,",
                                        textAlign: TextAlign.end,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {
                                      print("tapped");
                                    },
                                    color: Colors.amber,
                                    child: const Text("button"),
                                  ),
                                ),
                              )
                            ],
                          ));
                    });
              },
              child: const Icon(Icons.sim_card_alert)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          // body: const Center(
          //   child: TabBarView(
          //     children: <Widget>[
          //       Text(
          //         'First',
          //         textAlign: TextAlign.center,
          //       ),
          //       Text('Second', textAlign: TextAlign.center),
          //       Text('Third', textAlign: TextAlign.center),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

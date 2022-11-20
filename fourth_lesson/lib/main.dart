import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nav = ['Список 1', 'Список 2'];
  final List fakeData = List.generate(100, (index) => index.toString());

  Map<String, dynamic> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Homework example',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          toolbarHeight: 90,
          bottom: TabBar(
            tabs: data.keys.map((String item) => Tab(text: item)).toList(),
          ),
        ),
        body: TabBarView(
          children: data.keys.map((image) {
            if (image == data.keys.elementAt(0)) {
              return ListView(
                key: PageStorageKey(image),
                children: <Widget>[
                  for (var item in data.values.elementAt(0))
                    FadeInImage(
                      placeholder:
                          const AssetImage("assets/images/basketball.gif"),
                      image: NetworkImage(item),
                      height: 300,
                      fit: BoxFit.none,
                    )
                ],
              );
            } else {
              return ListView(
                key: PageStorageKey(image),
                children: <Widget>[
                  for (var item in data.values.elementAt(1))
                    FadeInImage(
                      placeholder:
                          const AssetImage("assets/images/basketball.gif"),
                      image: NetworkImage(item),
                      height: 300,
                      fit: BoxFit.none,
                    )
                ],
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}

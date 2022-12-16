import 'package:flutter/material.dart';

List spaces = [
  {
    "image": const AssetImage("assets/images/space0.jpg"),
    "uuid": "7b25e714",
    "name": "space0"
  },
  {
    "image": const AssetImage("assets/images/space1.jpg"),
    "uuid": "7b25e114",
    "name": "space1"
  },
  {
    "image": const AssetImage(
      "assets/images/space2.jpg",
    ),
    "uuid": "7b25e71774",
    "name": "space27"
  },
  {
    "image": const AssetImage(
      "assets/images/space3.jpg",
    ),
    "uuid": "7bgg25e714",
    "name": "space2"
  },
  {
    "image": const AssetImage(
      "assets/images/space4.jpg",
    ),
    "uuid": "7b25gge714",
    "name": "space3"
  },
  {
    "image": const AssetImage(
      "assets/images/space5.jpg",
    ),
    "uuid": "711b25e714",
    "name": "space24"
  },
  {
    "image": const AssetImage(
      "assets/images/space6.jpg",
    ),
    "uuid": "7b25e71114",
    "name": "space222"
  },
  {
    "image": const AssetImage(
      "assets/images/space7.jpg",
    ),
    "uuid": "732b25e714",
    "name": "space21"
  },
  {
    "image": const AssetImage(
      "assets/images/space8.jpg",
    ),
    "uuid": "7b2512e714",
    "name": "space23"
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: spaces.length,
          itemBuilder: (context, index) {
            return Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                      height: 270,
                      child: Hero(
                        tag: spaces[index]["uuid"],
                        child: FadeInImage(
                          placeholder:
                              const AssetImage("assets/basketball.gif"),
                          image: spaces[index]["image"],
                          height: 200,
                          width: 1000,
                          fit: BoxFit.fill,
                        ),
                      )),
                  Positioned(
                      top: 230,
                      child: Container(
                          width: 1400,
                          height: 80,
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                tag: spaces[index]["uuid"] + "123",
                                child: Text(
                                  spaces[index]["name"],
                                  textAlign: TextAlign.center,
                                ),
                              )))),
                  Positioned(
                    right: 60,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: 25,
                      child: MaterialButton(
                        minWidth: 45,
                        height: 45,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(
                                image: spaces[index]["image"],
                                uuid: spaces[index]["uuid"],
                                name: spaces[index]["name"]),
                          ));
                        },
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key, required this.image, required this.uuid, required this.name});
  final AssetImage image;
  final String uuid;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Hero(
            tag: uuid,
            child: FadeInImage(
              height: 400,
              image: image,
              placeholder: const AssetImage("assets/basketball.gif"),
            ),
          ),
          Hero(
            tag: name,
            child: Text(name),
          ),
        ],
      )),
    );
  }
}

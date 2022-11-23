import 'package:flutter/material.dart';

class MyFab extends StatefulWidget {
  MyFab({super.key});
  @override
  MyFabState createState() => MyFabState();
}

class MyFabState extends State<MyFab> {
  question() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.devices),
        onPressed: () {
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
            },
          );
        });
  }
}

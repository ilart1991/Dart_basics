import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:nine_lesson/hotel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<dynamic> hotels;
  bool isComplete = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isComplete = true;
    });
    final response = await http.get(Uri.parse(
        "https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301"));
    var data = jsonDecode(response.body);
    hotels = data.map((hotel) => Hotel.fromJson(hotel)).toList();

    setState(() {
      isComplete = false;
    });
  }

  void showList() {}

  void showGrid() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: showList, icon: const Icon(Icons.list)),
            IconButton(onPressed: showGrid, icon: const Icon(Icons.notes))
          ],
        ),
        body: isComplete == false
            ? ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (((context, index) {
                  return SafeArea(
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 5,
                      margin:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Column(
                        children: [
                          const FadeInImage(
                            placeholder: AssetImage("assets/basketball.gif"),
                            image: NetworkImage("https://picsum.photos/1000"),
                            height: 200,
                            width: 1000,
                            fit: BoxFit.none,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Row(
                              children: [
                                Text(hotels[index].name),
                                const Spacer(),
                                MaterialButton(
                                  onPressed: () {
                                    print("go detail");
                                  },
                                  child: const Text("Подробнее"),
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })))
            : const LinearProgressIndicator());
  }
}

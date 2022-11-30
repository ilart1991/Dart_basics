import 'package:flutter/material.dart';
import 'fetch_file.dart';

String fileName = "";
String fileData = "";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            controller: myController,
            decoration: InputDecoration(
              hintText: "Введите имя файла",
              border: const OutlineInputBorder(),
              suffixIcon: Container(
                margin: const EdgeInsets.all(0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: const Size(100, 60),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    "Найти",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    fileName = myController.text;
                    fetchFileFromAssets("assets/$fileName.txt").then((value) {
                      fileData = value;
                      print(fileData);
                    }).catchError((err) {
                      fileName = "Файл не найден";
                      fileData = "";
                    });
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              fileName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(fileData),
        ]),
      ),
    );
  }
}
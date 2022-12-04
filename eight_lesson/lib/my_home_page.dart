import 'package:flutter/material.dart';
import 'fetch_file.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  String fileName = "test"; // в поле ввода вводить имя файла без расширения
  String fileData = "";

  Future<String> onTap() async {
    setState(() {
      fileName = myController.text;
      fetchFileFromAssets("assets/$fileName.txt").then((txtData) {
        fileData = txtData;
      });
    });
    return fileName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<String>(
              future: fetchFileFromAssets("assets/$fileName.txt"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  fileName = myController.text;
                } else {
                  fileName = "Файл не найден";
                  fileData = "";
                }
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                onTap();
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
                    ]);
              }),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nine_lesson/widgets/my_gridview.dart';
import 'package:nine_lesson/widgets/my_listview.dart';
import '../hotel.dart';

late var hotels;

class HotelsList extends StatefulWidget {
  const HotelsList({super.key});
  @override
  State<HotelsList> createState() => _HotelsListState();
}

class _HotelsListState extends State<HotelsList> {
  bool grid = false;

  getData() async {
    final response = await http.get(Uri.parse(
        "https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301"));
    var data = jsonDecode(response.body);
    hotels = data.map<Hotel>((hotel) => Hotel.fromJson(hotel)).toList();
  }

  void showList() {
    grid = false;
    setState(() {});
  }

  void showGrid() {
    grid = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: showList, icon: const Icon(Icons.table_rows)),
            IconButton(
                onPressed: showGrid, icon: const Icon(Icons.collections_sharp))
          ],
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasError &&
                  snapshot.connectionState == ConnectionState.done) {
                return grid == false ? const MyListView() : const MyGridView();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

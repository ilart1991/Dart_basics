import 'package:flutter/material.dart';
import 'package:nine_lesson/pages/hotels_list.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: hotels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 4),
        itemBuilder: ((context, index) {
          return SafeArea(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Column(
                children: [
                  FadeInImage(
                    placeholder: const AssetImage("assets/basketball.gif"),
                    image: AssetImage("assets/images/${hotels[index].poster}"),
                    height: 100,
                    width: 1000,
                    fit: BoxFit.none,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    child: Text(
                      hotels[index].name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(200, 48),
                    ),
                    onPressed: () {
                      print("go detail");
                      Navigator.pushNamed(context,
                          "details/${hotels[index].uuid}/${hotels[index].name}");
                    },
                    child: const Text("Подробнее"),
                  )
                ],
              ),
            ),
          );
        }));
  }
}

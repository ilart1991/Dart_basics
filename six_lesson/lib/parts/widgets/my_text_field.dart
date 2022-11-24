import 'package:flutter/material.dart';

Padding myTextField = const Padding(
  padding: EdgeInsets.all(8.0),
  child: SafeArea(
    child: TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.purple)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.purple)),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.purple,
          ),
          label: Text(
            "Search",
            style: TextStyle(color: Colors.purple),
          ),
          helperText: "Поле для поиска заметок",
          hintText: "Введите значение"),
    ),
  ),
);

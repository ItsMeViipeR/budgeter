import 'package:flutter/material.dart';
import 'package:budgeter/components/home.page.component.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Budgeter',
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(elevation: 2),
      ),
      home: const BudgeterHome()));
}

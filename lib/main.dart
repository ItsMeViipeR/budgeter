import 'package:budgeter/utils/license.dart';
import 'package:flutter/material.dart';
import 'package:budgeter/components/home.page.component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  License license = License();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budgeter',
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(elevation: 2),
      ),
      home: BudgeterHome(license: license)));
}

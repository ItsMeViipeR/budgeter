import 'package:budgeter/components/home.page.component.dart';
import 'package:budgeter/components/planner.page.component.dart';
import 'package:flutter/material.dart';

class BudgeterSettings extends StatefulWidget {
  const BudgeterSettings({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BudgeterSettingsState();
  }
}

class _BudgeterSettingsState extends State<BudgeterSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 1,
      titleSpacing: 0,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BudgeterHome()),
              );
            },
            icon: const Icon(Icons.home)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BudgeterPlanner()),
              );
            },
            icon: const Icon(Icons.calendar_month)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      title: const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text("Budgeter Settings")),
    ));
  }
}

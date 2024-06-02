import 'package:budgeter/components/planner.page.component.dart';
import 'package:budgeter/components/settings.page.component.dart';
import 'package:flutter/material.dart';

class BudgeterHome extends StatefulWidget {
  const BudgeterHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BudgeterHomeState();
  }
}

class _BudgeterHomeState extends State<BudgeterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 1,
      titleSpacing: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BudgeterPlanner()),
              );
            },
            icon: const Icon(Icons.calendar_month)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BudgeterSettings()),
              );
            },
            icon: const Icon(Icons.settings)),
      ],
      title: const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0), child: Text("Budgeter")),
    ));
  }
}

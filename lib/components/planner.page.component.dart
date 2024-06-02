import 'package:budgeter/components/home.page.component.dart';
import 'package:budgeter/components/settings.page.component.dart';
import 'package:flutter/material.dart';

class BudgeterPlanner extends StatefulWidget {
  const BudgeterPlanner({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BudgeterPlannerState();
  }
}

class _BudgeterPlannerState extends State<BudgeterPlanner> {
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
        IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month)),
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
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text("Budgeter Planner")),
    ));
  }
}

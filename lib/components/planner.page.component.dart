import 'package:budgeter/components/home.page.component.dart';
import 'package:budgeter/components/settings.page.component.dart';
import 'package:flutter/material.dart';
import 'package:budgeter/utils/license.dart';

class BudgeterPlanner extends StatefulWidget {
  final License license;

  const BudgeterPlanner({super.key, required this.license});

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
                MaterialPageRoute(
                    builder: (context) =>
                        BudgeterHome(license: widget.license)),
              );
            },
            icon: const Icon(Icons.home)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BudgeterSettings(license: widget.license)),
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

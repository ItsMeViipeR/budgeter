// ignore_for_file: unused_field

import 'package:budgeter/components/card.component.dart';
import 'package:budgeter/components/monthly.page.component.dart';
import 'package:budgeter/components/planner.page.component.dart';
import 'package:budgeter/components/settings.page.component.dart';
import 'package:flutter/material.dart';
import 'package:budgeter/utils/license.dart';
import 'package:budgeter/components/chart.component.dart';
import 'package:budgeter/components/weekly.page.component.dart';

class BudgeterHome extends StatefulWidget {
  final License license;

  const BudgeterHome({super.key, required this.license});

  @override
  State<StatefulWidget> createState() {
    return _BudgeterHomeState();
  }
}

class _BudgeterHomeState extends State<BudgeterHome> {
  bool _showDialog = true;

  @override
  void initState() {
    super.initState();

    widget.license.readLicenseFile().then((value) {
      if (value['license']['accepted'] == true) {
        setState(() {
          _showDialog = false;
        });
      } else {
        setState(() {
          _showDialog = true;
        });
        Future.delayed(Duration.zero, () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('License agreement'),
                content: const Text(
                    'By accepting, I confirm that I\'ve read the license.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Deny"),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.license.writeLicenseFile();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Accept'),
                  ),
                ],
              );
            },
          );
        });
      }
    });
  }

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
                        builder: (context) =>
                            BudgeterPlanner(license: widget.license)),
                  );
                },
                icon: const Icon(Icons.calendar_month)),
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
              child: Text("Budgeter")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            //crossAxisCount: 2,
            children: [
              BudgeterCard(
                  title: "Weekly",
                  icon: Icons.calendar_month,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WeeklyPage(license: widget.license)),
                    );
                  },
                  child:
                      // limit the size of chart
                      SizedBox(
                          width: 1000, height: 100, child: weeklyBarChart())),
              BudgeterCard(
                  title: "Monthly",
                  icon: Icons.calendar_month,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MonthlyPage(license: widget.license)),
                    );
                  },
                  child:
                      // limit the size of chart
                      SizedBox(
                          width: 1000, height: 100, child: monthlyBarChart())),
            ],
          ),
        ));
  }
}

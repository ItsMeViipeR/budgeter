import 'package:budgeter/components/chart.component.dart';
import 'package:budgeter/components/home.page.component.dart';
import 'package:budgeter/components/settings.page.component.dart';
import 'package:flutter/material.dart';
import 'package:budgeter/utils/license.dart';

class MonthlyPage extends StatefulWidget {
  final License license;

  const MonthlyPage({super.key, required this.license});

  @override
  State<StatefulWidget> createState() {
    return _MonthlyPageState();
  }
}

class _MonthlyPageState extends State<MonthlyPage> {
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
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.calendar_month)),
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
              child: Text("Budgeter Monthly")),
        ),
        body: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
          child: SizedBox(
            height: 300, // adjust the height to your liking
            width: double.infinity, // take up the full width of the screen
            child: monthlyBarChart(),
          ),
        ));
  }
}

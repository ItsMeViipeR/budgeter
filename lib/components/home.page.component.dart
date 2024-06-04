import 'dart:io';

import 'package:budgeter/components/button.component.dart';
import 'package:budgeter/components/planner.page.component.dart';
import 'package:budgeter/components/settings.page.component.dart';
import 'package:flutter/material.dart';
import 'package:budgeter/utils/license.dart';

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
      print(value['license']['accepted']);
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
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0), child: Text("Budgeter")),
      ),
      body: Center(
        child: Button(
          onPress: () {
            showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: const Text("License"),
                    content: FutureBuilder(
                      future: widget.license.readLicenseFile(),
                      builder: (context, snapshot) {
                        //print(snapshot.data);
                        if (snapshot.hasData) {
                          Map<String, dynamic> data =
                              snapshot.data as Map<String, dynamic>;
                          if (data['license']['accepted'] == true) {
                            return const Text("License accepted");
                          } else {
                            return const Text("License not accepted");
                          }
                        } else {
                          return const LinearProgressIndicator();
                        }
                      },
                    ),
                  );
                });
          },
          text: "text",
        ),
      ),
    );
  }
}

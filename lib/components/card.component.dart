import 'package:flutter/material.dart';

class BudgeterCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  final Widget? child; // Add this property

  const BudgeterCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.child, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(icon),
                title: Text(title),
                dense: true,
              ),
              child ?? const Text("Hey"), // Add the child here
            ],
          ),
        ),
      ),
    );
  }
}

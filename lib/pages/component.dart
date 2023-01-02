import 'package:flutter/material.dart';

class SiteAlert extends StatelessWidget {
  const SiteAlert({
    super.key,
    required this.title,
    required this.subject,
    required this.action
  });
  final String title;
  final Widget subject;
  final List<Widget> action;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title:  Center(
            child: Text(title)),
        content: subject,
        actions: action
    );
  }
}
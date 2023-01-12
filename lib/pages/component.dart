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

class ExpandContainer extends StatelessWidget {
  const ExpandContainer({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding:  const EdgeInsets.all(8.0),
      child: Card(child:  SizedBox(height: 160,child: Column(
        children: [
          Text(title,style:const TextStyle(fontSize: 20),),
          Expanded(child: Container(
              alignment: Alignment.center,
              child:  Text(body,style: const TextStyle(fontSize: 30),)))

        ],
      ),),),
    ));
  }
}

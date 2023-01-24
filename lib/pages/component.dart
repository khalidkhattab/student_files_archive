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

class TextFormArchive extends StatelessWidget {
  const TextFormArchive(
      {Key? key,
        required this.controller,
        required this.label,
        required this.password,
        required  this.alert,
      })
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool password;
 final String alert;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Container(
        height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextFormField(
              validator:(value){
                if(value == null || value.isEmpty){
                  return alert;
                }
                return null;
              },
              obscureText: password,
              controller: controller,
              decoration: InputDecoration(
                label: Text(label),
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}

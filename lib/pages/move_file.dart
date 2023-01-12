
import 'package:filearchive/pages/component.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class MoveFile extends StatelessWidget {
  const MoveFile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        color: SiteColor.bgColor2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('نقل الملفات', style: TextStyle(fontSize: 30),),
              Row(children: const [

              ],)
            ],),
        ),
      ),
    );
  }
}
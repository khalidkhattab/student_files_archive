
import 'package:filearchive/pages/component.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class SchoolInfo extends StatelessWidget {
  const SchoolInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            color: SiteColor.bgColor2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
              [
                const Text('بيانات المدرسة', style: TextStyle(fontSize: 30),),
                Row(children: const [

                ],),
]
            ),
          ),
        ),
      )),
    );
  }
}
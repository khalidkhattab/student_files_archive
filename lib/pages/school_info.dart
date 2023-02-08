
import 'package:filearchive/pages/component.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class SchoolInfo extends StatelessWidget {
   SchoolInfo({
    Key? key,
  }) : super(key: key);
final TextEditingController nameController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
            [
              const Text('بيانات المدرسة', style: TextStyle(fontSize: 30),),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: SiteColor.cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: SiteColor.bgColor,
                        width: double.infinity,
                        child:const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text(
                            'بيانات المدرسة',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 400,
                            child: TextFormArchive(
                                controller: nameController,
                                label: 'اختر المنطقة',
                                password: false,
                                alert: 'ادخل الاسم'),
                          ),
                          SizedBox(
                            width: 400,
                            child: TextFormArchive(
                                controller: nameController,
                                label: 'اختر المرحلة',
                                password: false,
                                alert: 'ادخل الرقم المدني'),
                          ),
                          SizedBox(
                            width: 400,
                            child: TextFormArchive(
                                controller: nameController,
                                label: 'اختر المدرسة',
                                password: false,
                                alert: 'ادخل الصف'),
                          ),
                          SizedBox(
                            width: 400,
                            child: TextFormArchive(
                                controller: nameController,
                                label: 'شعار المدرسة',
                                password: false,
                                alert: 'ادخل الفصل'),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: SiteColor.cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: SiteColor.bgColor,
                        width: double.infinity,
                        child:const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text(
                            ' الفصول',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 400,
                            child: TextFormArchive(
                                controller: nameController,
                                label: 'اختر المنطقة',
                                password: false,
                                alert: 'ادخل الاسم'),
                          ),
                          SizedBox(
                            width: 400,
                            child: TextFormArchive(
                                controller: nameController,
                                label: 'اختر المرحلة',
                                password: false,
                                alert: 'ادخل الرقم المدني'),
                          ),
                          SizedBox(
                            width: 400,
                            child: TextFormArchive(
                                controller: nameController,
                                label: 'اختر المدرسة',
                                password: false,
                                alert: 'ادخل الصف'),
                          ),
                          SizedBox(
                            width: 400,
                            child: TextFormArchive(
                                controller: nameController,
                                label: 'شعار المدرسة',
                                password: false,
                                alert: 'ادخل الفصل'),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
]
          ),
          ),
      )),
    );
  }
}
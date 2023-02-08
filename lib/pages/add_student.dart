import 'package:filearchive/pages/component.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class AddStudent extends StatelessWidget {
  AddStudent({
    Key? key,
  }) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cId = TextEditingController();
  final TextEditingController sClass = TextEditingController();

  get item3 => null;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                ' اضافة طالب جديد',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 50,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
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
                                     'بيانات الطالب',
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
                                        label: 'اسم الطالب',
                                        password: false,
                                        alert: 'ادخل الاسم'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: cId,
                                        label: 'الرقم المدني',
                                        password: false,
                                        alert: 'ادخل الرقم المدني'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: sClass,
                                        label: 'الصف',
                                        password: false,
                                        alert: 'ادخل الصف'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: nameController,
                                        label: 'الفصل',
                                        password: false,
                                        alert: 'ادخل الفصل'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: cId,
                                        label: 'تاريخ الميلاد',
                                        password: false,
                                        alert: 'ادخل تاريخ الميلاد'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: sClass,
                                        label: 'الصورة',
                                        password: false,
                                        alert: 'حدد الصورة'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                                    'بيانات ولي الامر',
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
                                        label: 'اسم الطالب',
                                        password: false,
                                        alert: 'ادخل الاسم'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: cId,
                                        label: 'الرقم المدني',
                                        password: false,
                                        alert: 'ادخل الرقم المدني'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: sClass,
                                        label: 'الصف',
                                        password: false,
                                        alert: 'ادخل الصف'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: nameController,
                                        label: 'الفصل',
                                        password: false,
                                        alert: 'ادخل الفصل'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: cId,
                                        label: 'تاريخ الميلاد',
                                        password: false,
                                        alert: 'ادخل تاريخ الميلاد'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: sClass,
                                        label: 'الصورة',
                                        password: false,
                                        alert: 'حدد الصورة'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                                    'بيانات الام',
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
                                        label: 'اسم الطالب',
                                        password: false,
                                        alert: 'ادخل الاسم'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: cId,
                                        label: 'الرقم المدني',
                                        password: false,
                                        alert: 'ادخل الرقم المدني'),
                                  ),

                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: nameController,
                                        label: 'الفصل',
                                        password: false,
                                        alert: 'ادخل الفصل'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: cId,
                                        label: 'تاريخ الميلاد',
                                        password: false,
                                        alert: 'ادخل تاريخ الميلاد'),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormArchive(
                                        controller: sClass,
                                        label: 'الصورة',
                                        password: false,
                                        alert: 'حدد الصورة'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            minWidth: 150,
                            height: 55,
                            onPressed: () {},
                            color: SiteColor.sideBarColor,
                            child: const Text('أضافة'),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          MaterialButton(
                            minWidth: 150,
                            height: 55,
                            onPressed: () {},
                            color: SiteColor.cardColor,
                            child: const Text('مسح'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

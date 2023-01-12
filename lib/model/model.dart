import 'package:filearchive/main.dart';
import 'package:filearchive/pages/browse_file.dart';
import 'package:filearchive/pages/dashboard.dart';
import 'package:filearchive/pages/edit_file.dart';
import 'package:filearchive/pages/move_file.dart';
import 'package:filearchive/pages/school_info.dart';
import 'package:flutter/material.dart';

class SiteItems{

  late String title;
  late Widget screen;
  late IconData icon;

  SiteItems({required this.title,required this.screen, required this.icon});
}

List<SiteItems> siteContent=[
  SiteItems(title:'Home', screen: const DashBoard(), icon: Icons.home),
  SiteItems(title:'Class List', screen: const SchoolInfo(), icon: Icons.list),
  SiteItems(title:'Add Student', screen: const MoveFile(), icon: Icons.add),
  SiteItems(title:'Move Student', screen: const EditFile(), icon: Icons.move_to_inbox),
  SiteItems(title:'Edit Items', screen: const BrowseFile(), icon: Icons.edit),
];


class SiteColor{
  static Color mainColor=const Color(0xff0087Ac);
  static Color sideBarColor=const Color(0xff2980B9);
  static Color bgColor=const Color(0xff00A88F);
  static Color bgColor2=const Color(0xffAEB6BF);
  static Color bgColor3=const Color(0xff82c272);//#82E0AA
  static Color bgColor4=const Color(0xff82E0AA);
}




List<String> drawerItem=[
  'Class List',
  'Add New','Move Student','New Arrive','Edit Student'
];

List<Map<String, String>> onBoarding=[
  {"title":"موقع ملفاتي","subject":"موقع مختص بالتعامل مع ملفات طلاب المدرسة","Image":"mangeFile.png"},
  {"title":"رفع ملفات","subject":"رفع ملفات الطلاب في مكان واحد و استعراضها في اي مكان","Image":"upLoadFile.png"},
  {"title":"نقل ملفات","subject":"نقل الملفات بين المدارس في ثوان معدودة","Image":"moveFile.png"},
  {"title":"ادارة ملفات","subject":"ادارة الملفات بسرعة و سهولة","Image":"mangeFile.png"},

];

List<Map<String, Widget?>> sideBarItem=[
  {'Title':const Text('الرئيسية'),'Icon':const Icon(Icons.home),'Screen':const DashBoard() },
  {'Title':const Text('بيانات المدرسة'),'Icon':const Icon(Icons.list),'Screen':const MyHomePage() },
  {'Title':const Text('نقل ملفات'),'Icon':const Icon(Icons.move_to_inbox),'Screen':const MyHomePage() },
  {'Title':const Text('تعديل ملف'),'Icon':const Icon(Icons.edit),'Screen':const MyHomePage() },
  {'Title':const Text('استعراض ملف'),'Icon':const Icon(Icons.folder),'Screen':const MyHomePage() },

];
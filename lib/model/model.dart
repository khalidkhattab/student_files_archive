import 'package:filearchive/main.dart';
import 'package:filearchive/pages/add_student.dart';
import 'package:filearchive/pages/browse_file.dart';
import 'package:filearchive/pages/dashboard.dart';
import 'package:filearchive/pages/edit_file.dart';
import 'package:filearchive/pages/move_file.dart';
import 'package:filearchive/pages/school_info.dart';
import 'package:flutter/material.dart';



class SiteColor{
  static Color mainColor=const Color(0xff0087Ac);
  static Color sideBarColor=const Color(0xff2980B9);
  static Color bgColor=const Color(0xff00A88F);
  static Color bgColor2=const Color(0xffAEB6BF);
  static Color bgColor3=const Color(0xff82c272);//#82E0AA
  static Color bgColor4=const Color(0xff82E0AA);
  static Color cardColor=const Color(0xff82E0AA);
}




List<Map<String, String>> onBoarding=[
  {"title":"موقع ملفاتي","subject":"موقع مختص بالتعامل مع ملفات طلاب المدرسة","Image":"mangeFile.png"},
  {"title":"رفع ملفات","subject":"رفع ملفات الطلاب في مكان واحد و استعراضها في اي مكان","Image":"upLoadFile.png"},
  {"title":"نقل ملفات","subject":"نقل الملفات بين المدارس في ثوان معدودة","Image":"moveFile.png"},
  {"title":"ادارة ملفات","subject":"ادارة الملفات بسرعة و سهولة","Image":"mangeFile.png"},

];

List<Map<String, Widget?>> sideBarItem=[
  {'Title':const Text('الرئيسية'),'Icon':const Icon(Icons.home),'Screen': DashBoard() },
  {'Title':const Text('بيانات المدرسة'),'Icon':const Icon(Icons.list),'Screen':const SchoolInfo() },
  {'Title':const Text('اضافة طالب'),'Icon':const Icon(Icons.list),'Screen': AddStudent() },
  {'Title':const Text('نقل ملفات'),'Icon':const Icon(Icons.move_to_inbox),'Screen':const MoveFile() },
  {'Title':const Text('تعديل ملف'),'Icon':const Icon(Icons.edit),'Screen':const EditFile() },
  {'Title':const Text('استعراض ملف'),'Icon':const Icon(Icons.folder),'Screen':const BrowseFile() },

];
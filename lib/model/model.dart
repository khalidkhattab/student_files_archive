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

List<Map<String, dynamic>> sideBarItem=[
  {'Title':const Text('الرئيسية',style: TextStyle(fontSize: 15),),'Icon':const Icon(Icons.home),'Screen': DashBoard(),'position':0},
  {'Title':const Text('بيانات المدرسة',style: TextStyle(fontSize: 15)),'Icon':const Icon(Icons.list),'Screen': SchoolInfo(),'position':1 },
  {'Title':const Text('اضافة طالب',style: TextStyle(fontSize: 15)),'Icon':const Icon(Icons.add),'Screen': AddStudent(),'position':2 },
  {'Title':const Text('نقل ملفات',style: TextStyle(fontSize: 15)),'Icon':const Icon(Icons.move_to_inbox),'Screen':const MoveFile(),'position':3 },
  {'Title':const Text('تعديل ملف',style: TextStyle(fontSize: 15)),'Icon':const Icon(Icons.edit),'Screen':const EditFile() ,'position':4},
  {'Title':const Text('استعراض ملف',style: TextStyle(fontSize: 15)),'Icon':const Icon(Icons.folder),'Screen':const BrowseFile(),'position':5 },

];
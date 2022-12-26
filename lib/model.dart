import 'package:filearchive/main.dart';
import 'package:flutter/material.dart';

class SiteItems{

  late String title;
  late Widget screen;
  late IconData icon;

  SiteItems({required this.title,required this.screen, required this.icon});
}

List<SiteItems> siteContent=[
  SiteItems(title:'Home', screen: const MyHomePage(), icon: Icons.home),
  SiteItems(title:'Class List', screen: const MyHomePage(), icon: Icons.list),
  SiteItems(title:'Add Student', screen: const MyHomePage(), icon: Icons.add),
  SiteItems(title:'Move Student', screen: const MyHomePage(), icon: Icons.move_to_inbox),
  SiteItems(title:'Edit Items', screen: const MyHomePage(), icon: Icons.edit),
];


class SiteColor{
  static Color mainColor=const Color(0xff0087Ac);
  static Color sideBarColor=const Color(0xff323B81);
  static Color bgColor=const Color(0xff00A88F);
  static Color bgColor2=const Color(0xff005faa);
  static Color bgColor3=const Color(0xff82c272);
}
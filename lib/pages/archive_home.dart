import 'package:filearchive/main.dart';
import 'package:flutter/material.dart';
class MainArchive extends StatelessWidget {
  const MainArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, Widget>> drawerScreen=[
      {'Screen1':const MyHomePage()},
      {'Screen2':const MyHomePage()},{'Screen3':const MyHomePage()},{'Screen4':const MyHomePage()},{'Screen5':const MyHomePage()}
    ];

    return  Scaffold(

      body:const Center(child: Text('ارشيف الملفات',)),
      floatingActionButton:FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

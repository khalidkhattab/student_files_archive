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
    List<String> drawerItem=[
     'Class List',
     'Add New','Move Student','New Arrive','Edit Student'
    ];
    return  Scaffold(
      drawer:  Drawer(
        child: ListView.builder(
            itemCount: drawerItem.length,
            itemBuilder: (context, index){
          return Card(
            child: TextButton(onPressed: (){
              
            }, child: Text(drawerItem[index])),
          );
        }),
      ),
      appBar: AppBar(title:const Text('ملفاتي'),),
      body:const Center(child: Text('ارشيف الملفات',style: TextStyle(color: Colors.white),)),
      floatingActionButton:FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

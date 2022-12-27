import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/bloc/cubit_assits.dart';
import 'package:filearchive/main.dart';
import 'package:filearchive/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MainArchive extends StatelessWidget {
  const MainArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, Widget>> drawerScreen=[
      {'Screen1':const MyHomePage()},
      {'Screen2':const MyHomePage()},{'Screen3':const MyHomePage()},{'Screen4':const MyHomePage()},{'Screen5':const MyHomePage()}
    ];

    return  BlocConsumer<ArchiveCubit,  CubitAssets>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final cubit=ArchiveCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ملفاتي'),
        actions: [
          IconButton(
              onPressed: () {
                cubit.darkModeOn();
              },
              icon: const Icon(Icons.sunny)),
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen())));
          }, icon:const Icon(Icons.exit_to_app))
        ],
      ),
      body:const Center(child: Text('ارشيف الملفات',)),
      floatingActionButton:FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  },
);
  }
}

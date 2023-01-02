import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/bloc/cubit_assits.dart';
import 'package:filearchive/main.dart';
import 'package:filearchive/model.dart';
import 'package:filearchive/pages/component.dart';
import 'package:filearchive/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainArchive extends StatelessWidget {
  const MainArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, Widget>> drawerScreen = [
      {'Screen1': const MyHomePage()},
      {'Screen2': const MyHomePage()},
      {'Screen3': const MyHomePage()},
      {'Screen4': const MyHomePage()},
      {'Screen5': const MyHomePage()}
    ];

    return BlocConsumer<ArchiveCubit, CubitAssets>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = ArchiveCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        color: SiteColor.sideBarColor,
                        child: Column(
                          children: [
                            const Card(
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                      'ملفاتي',
                                      style: TextStyle(fontSize: 20),
                                    )))),
                            Expanded(
                                child: Container(
                              color: Colors.blueGrey,
                            )),
                            Card(
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              cubit.darkModeOn();
                                            },
                                            icon: const Icon(Icons.sunny)),
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      SiteAlert(
                                                          title: 'تنبيه',
                                                          subject: const Text(
                                                              'هل تريد تسجيل الخروج'),
                                                          action: [
                                                            MaterialButton(
                                                              onPressed: () {
                                                                FirebaseAuth
                                                                    .instance
                                                                    .signOut()
                                                                    .then((value) => Navigator.pushReplacement(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const LoginScreen())));
                                                              },
                                                              color: Colors.red,
                                                              child: const Text(
                                                                  'نعم'),
                                                            ),

                                                            MaterialButton(
                                                              onPressed: () {
                                                                Navigator.pop(context);
                                                              },
                                                              color: Colors.green,
                                                              child:const  Text(
                                                                  'لا'),
                                                            ),
                                                          ]));
                                            },
                                            icon: const Icon(Icons.exit_to_app))
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        color: SiteColor.bgColor2,
                        child: Column(children: [
                          Row(children: [
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(child: Container(height: 160,),),
                            )),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(child: Container(height: 160,),),
                            )),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(child: Container(height: 160,),),
                            ))
                          ],)
                        ],),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

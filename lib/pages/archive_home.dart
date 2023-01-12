import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/bloc/cubit_assits.dart';
import 'package:filearchive/main.dart';
import 'package:filearchive/model/model.dart';
import 'package:filearchive/pages/component.dart';
import 'package:filearchive/pages/dashboard.dart';
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
        double kWidth=MediaQuery.of(context).size.width;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        color: SiteColor.bgColor,
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
                            const SizedBox(height: 100,),
                            Expanded(
                                child:  SizedBox(
                                  child: ListView.builder(
                                      itemCount: sideBarItem.length,
                                      itemBuilder: (context, index){
                                    return SizedBox(
                                        height: 80,

                                        child:ListTile(
                                          onTap: (){
                                            cubit.changePage(index: index);
                                          },
                                          title: sideBarItem[index]['Title'],
                                          leading: sideBarItem[index]['Icon'] ,
                                            minLeadingWidth:0,

                                          trailing:Visibility(
                                              visible:kWidth>1500 ,
                                              child:  const Icon(Icons.arrow_forward_ios))),
                                        );

                                  }),
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
                    flex: 6,
                    child:siteContent[cubit.currentPage].screen,)
              ],
            ),
          ),
        );
      },
    );
  }
}




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
  MainArchive({Key? key}) : super(key: key);

  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArchiveCubit, CubitAssets>(
      listener: (context, state) {
        final cubit = ArchiveCubit.get(context);

        // TODO: implement listener
        if (state is GetStudentDataSuccessStatus) {
          print(cubit.dataFromFirebase);
        }
      },
      builder: (context, state) {
        final cubit = ArchiveCubit.get(context);
        double kWidth = MediaQuery.of(context).size.width;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title:const Text('ملفاتي: ث خالد سعود الزيد'),
              backgroundColor: SiteColor.mainColor,
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.getClassrooms(lClass: cubit.stage);
                    },
                    icon: const Icon(Icons.ac_unit_sharp)),
                IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      cubit.darkModeOn();
                    },
                    icon: const Icon(Icons.sunny)),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => SiteAlert(
                                  title: 'تنبيه',
                                  subject: const Text('هل تريد تسجيل الخروج'),
                                  action: [
                                    MaterialButton(
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut().then(
                                            (value) => Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen())));
                                      },
                                      color: Colors.red,
                                      child: const Text('نعم'),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      color: Colors.green,
                                      child: const Text('لا'),
                                    ),
                                  ]));
                    },
                    icon: const Icon(Icons.exit_to_app))
              ],
            ),
            // backgroundColor: SiteColor.bgColor2,
            drawer: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: SiteColor.bgColor.withOpacity(.95)),
                child: Drawer(
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                          height: 100,
                          decoration: BoxDecoration(color: SiteColor.mainColor),
                          width: double.infinity,
                          child: const Center(
                              child: Text(
                            'ملفاتي',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ))),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                          child: SizedBox(
                        child: ListView.builder(
                            itemCount: sideBarItem.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 50,
                                color: cubit.currentPage == index
                                    ? SiteColor.sideBarColor.withOpacity(.5)
                                    : SiteColor.bgColor,
                                child: ListTile(
                                    onTap: () {
                                      cubit.currentPage = index;
                                      print(index);
                                      cubit.changePage(index: index);
                                      Navigator.pop(context);
                                    },
                                    title: sideBarItem[index]['Title'],
                                    leading: sideBarItem[index]['Icon'],
                                    minLeadingWidth: 0,
                                    trailing:
                                         Icon(Icons.arrow_forward_ios, color:cubit.currentPage==index
                                        ? Colors.deepOrange
                                        : null)),
                              );
                            }),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
                child: sideBarItem[cubit.currentPage]['Screen']),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.addNewClass(stage: '10', collectionPath: '102');
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('اضافة طالب جديد'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Text('name'),
                                  SizedBox(
                                      width: 450,
                                      child: TextFormArchive(
                                          controller: name,
                                          label: 'ادخل الاسم',
                                          password: false,
                                          alert: 'يجب ادخال اسم الطالب'))
                                ],
                              ),
                              MaterialButton(
                                onPressed: () {
                                  cubit.addNewStudent(
                                      stage: cubit.stage,
                                      sClass: '11د1',
                                      cId: name.text);
                                },
                                child: Text('اضافة'),
                                color: SiteColor.sideBarColor,
                              )
                            ],
                          ),
                        ));
              },
              child: (state is AddNewStudentDataLoadingStatus)
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}

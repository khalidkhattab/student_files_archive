import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/model/model.dart';
import 'package:filearchive/pages/archive_home.dart';
import 'package:filearchive/pages/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_assits.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;
    double kHeight = MediaQuery.of(context).size.height;
    PageController pageViewController = PageController(
      initialPage: 0,
    );
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<ArchiveCubit, CubitAssets>(builder: (context, status) {
      final cubit = ArchiveCubit.get(context);
      final  formKey=GlobalKey<FormState>();
      return Scaffold(

        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.lightGreenAccent,
              width: kWidth > 1200
                  ? kWidth * .5
                  : kWidth > 800
                      ? kWidth * 0.8
                      : kWidth * .9,
             height: 650,
             child: Row(
                children: [
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: Container(
                        color: SiteColor.bgColor4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Image(image: AssetImage('assets/images/mangeFile.png',),width: 120,),
                            ),
                            const Text(
                              'ملفاتي',
                              style: TextStyle(fontSize: 25),
                            ),
                            Column(
                              children: [
                                TextFormArchive(
                                  controller: emailController,
                                  label: 'اسم المستخدم',
                                  password: false,
                                  alert: 'يجب ادخال اسم المستخدم',
                                ),
                                TextFormArchive(
                                  controller: passwordController,
                                  label: 'كلمة المرور',
                                  password: true,
                                  alert: 'يجب ادخال كلمة المرور',
                                ),
                               const SizedBox(height: 60,),
                                Visibility(
                                    visible: status is SignInWithEmailLoadingStatus,
                                    child: const CircularProgressIndicator()),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: MaterialButton(
                                    minWidth: 180,
                                    elevation: 10,
                                    height: 50,
                                    onPressed: () {
                                     if(formKey.currentState!.validate()){
                                       cubit.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

                                     }
                                    },
                                    color: Colors.teal,
                                    child: const Text(
                                      'دخول',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => SiteAlert(

                                            subject: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Text(
                                                    'لا يمكن اعادة تعين كلمة المرور من الموقع '),
                                                Text(
                                                    'تواصل مع مسئول الموقع لاعادة تعينها'),
                                              ],
                                            ),
                                            title: 'تنبية',
                                            action: [
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                color: SiteColor.bgColor4,
                                                child: const Text('تم'),
                                              )
                                            ],
                                          ));
                                    },
                                    child: const Text('نسيت كلمة المرور؟'))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: kWidth > 900,

                    child: Expanded(
                      child: Container(
                        color: SiteColor.bgColor3,
                        child: PageView(
                            controller: pageViewController,
                            scrollDirection: Axis.horizontal,
                            children: onBoarding.map((e) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Spacer(),
                                  Text(
                                    e['title']!,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(e['subject']!),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/${e['Image']}'),
                                      width: kWidth * .1,
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        MaterialButton(
                                          onPressed: cubit.onBoardingLess
                                              ? null
                                              : () {
                                                  pageViewController
                                                      .previousPage(
                                                          duration:
                                                              const Duration(
                                                                  microseconds:
                                                                      200),
                                                          curve: Curves
                                                              .easeInOutQuart)
                                                      .then((value) {
                                                    cubit.onBoardingChange(
                                                        pageViewController.page);
                                                  });
                                                },
                                          color: SiteColor.bgColor,
                                          child: const Text('السابق'),
                                        ),
                                        MaterialButton(
                                          onPressed: cubit.onBoardingDone
                                              ? null
                                              : () {
                                                  pageViewController
                                                      .nextPage(
                                                          duration:
                                                              const Duration(
                                                                  microseconds:
                                                                      200),
                                                          curve:
                                                              Curves.elasticInOut)
                                                      .then((value) {
                                                    cubit.onBoardingChange(
                                                        pageViewController.page);
                                                  });
                                                },
                                          color: SiteColor.bgColor,
                                          child: const Text('التالي'),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }).toList()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }, listener: (context, status) {
      if (status is SignInWithEmailSuccessStatus) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  MainArchive()));
      }
      if(status is SignInWithEmailErrorStatus){
        showDialog(context: context, builder: (context)=> AlertDialog(
          title:const  Text('تنبيه'),
          content:const   Text('خطا بتسجيل الدخول'),
          actions: [
            MaterialButton(onPressed: (){
              Navigator.pop(context);
            }, child:const   Text('موافق'),)
          ],
        ));
      }
    });
  }
}




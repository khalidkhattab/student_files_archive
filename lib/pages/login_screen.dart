import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/model/model.dart';
import 'package:filearchive/pages/archive_home.dart';
import 'package:filearchive/pages/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_assits.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;

    PageController pageViewController = PageController(
      initialPage: 0,
    );
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<ArchiveCubit, CubitAssets>(builder: (context, status) {
      final cubit = ArchiveCubit.get(context);
      final  formKey=GlobalKey<FormState>();
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Archive file'),
          actions: [
            IconButton(
                onPressed: () {
                  cubit.darkModeOn();
                },
                icon: const Icon(Icons.sunny))
          ],
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
            color: Colors.lightGreenAccent,
            width: kWidth > 1200
                ? kWidth * .5
                : kWidth > 1000
                    ? kWidth * .6
                    : kWidth * .8,
            height: 450,
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
                          const Text(
                            'ملفاتي',
                            style: TextStyle(fontSize: 25),
                          ),
                          Column(
                            children: [
                              TextFormArchive(
                                emailController: emailController,
                                label: 'اسم المستخدم',
                                password: false,
                              ),
                              TextFormArchive(
                                emailController: passwordController,
                                label: 'كلمة المرور',
                                password: true,
                              ),
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
                                     cubit.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
                                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainArchive()));

                                     });

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
      );
    }, listener: (context, status) {
      if (status is SignInWithEmailSuccessStatus) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainArchive()));
      }
    });
  }
}



class TextFormArchive extends StatelessWidget {
  const TextFormArchive(
      {Key? key,
      required this.emailController,
      required this.label,
      required this.password})
      : super(key: key);

  final TextEditingController emailController;
  final String label;
  final bool password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextFormField(
              validator:(value){
                if(value == null || value.isEmpty){
                  return 'يجب ادخال اسم المستخدم و كلمة المرور';
                }
                return null;
              },
              obscureText: password,
              controller: emailController,
              decoration: InputDecoration(
                label: Text(label),
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}

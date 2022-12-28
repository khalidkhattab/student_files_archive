import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/model.dart';
import 'package:filearchive/pages/archive_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/cubit_assits.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<ArchiveCubit, CubitAssets>(builder: (context, status) {
      final cubit = ArchiveCubit.get(context);
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
            width: 700,
            height: 450,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: SiteColor.bgColor4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'File Archive',
                          style: GoogleFonts.lobster(
                            fontSize: 33,
                          ),

                          //TextStyle(
                          //                                   fontSize: 33,
                          //                                   fontWeight: FontWeight.bold,
                          //                                   color: Colors.white),
                        ),
                        Column(
                          children: [
                            TextFormArchive(emailController: emailController),
                            TextFormArchive(
                                emailController: passwordController),
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
                                  try {
                                    cubit.signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  } on Exception catch (_) {
                                    print('e.toString()');
                                  }
                                },
                                color: Colors.teal,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: SiteColor.bgColor3,
                    child: PageView(
                      scrollDirection: Axis.horizontal,

                      children: [
                        Container(
                          color: Colors.yellow,
                          child: Column(
                            children: const [
                              Text('File Archive3'),
                              Image(image: AssetImage('assets/images/student.jpg'))
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: const [
                              Text('File Archive1'),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: const [
                              Text('File Archive2'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     FirebaseAuth.instance
        //         .signInWithEmailAndPassword(
        //         email: 'khattab832001@gmail.com', password: '295533')
        //         .then((value) => print(value.additionalUserInfo));
        //   },
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }, listener: (context, status) {
      if (status is SignInWithEmailSuccessStatus) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainArchive()));
      }
    });
    ;
  }
}

class TextFormArchive extends StatelessWidget {
  const TextFormArchive({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

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
              controller: emailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}

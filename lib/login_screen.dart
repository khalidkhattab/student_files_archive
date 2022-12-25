import 'package:filearchive/archive_home.dart';
import 'package:filearchive/bloc/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit_assits.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return  BlocConsumer<ArchiveCubit, CubitAssets>(
        builder: (context, status) {
          final cubit = ArchiveCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text('Archive file'),
            ),
            body: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'File Archive',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    child: SizedBox(
                      width: kWidth > 800 ? 500 : kWidth * 0.7,
                      height: 400,
                      child: Column(
                        // Column is also a layout widget. It takes a list of children and
                        // arranges them vertically. By default, it sizes itself to fit its
                        // children horizontally, and tries to be as tall as its parent.
                        //
                        // Invoke "debug painting" (press "p" in the console, choose the
                        // "Toggle Debug Paint" action from the Flutter Inspector in Android
                        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                        // to see the wireframe for each widget.
                        //
                        // Column has various properties to control how it sizes itself and
                        // how it positions its children. Here we use mainAxisAlignment to
                        // center the children vertically; the main axis here is the vertical
                        // axis because Columns are vertical (the cross axis would be
                        // horizontal).
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormArchive(emailController: emailController),
                          TextFormArchive(emailController: passwordController),
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

                                try{
                                  cubit.signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }on Exception catch (_){
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                    email: 'khattab832001@gmail.com', password: '295533')
                    .then((value) => print(value.additionalUserInfo));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
        listener: (context, status) {
          if(status is SignInWithEmailSuccessStatus){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainArchive()));
          }
        });;
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

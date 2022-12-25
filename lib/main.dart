import 'package:filearchive/archive_home.dart';
import 'package:filearchive/bloc/bloc_observer.dart';
import 'package:filearchive/bloc/cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit_assits.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDnbb-OYhMh5Kr2VfiFP67j1uONooeXdEc",
        authDomain: "file-archive-c8e98.firebaseapp.com",
        projectId: "file-archive-c8e98",
        storageBucket: "file-archive-c8e98.appspot.com",
        messagingSenderId: "853350149517",
        appId: "1:853350149517:web:bf1f98590bcee3e8da61c4",
        measurementId: "G-5TR8Q4YSPX"),
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ArchiveCubit(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:  const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ArchiveCubit, CubitAssets>(
        builder: (context, status) {
          final cubit = ArchiveCubit.get(context);
          return const Scaffold(
            body:MainArchive(),   //cubit.user!=null?const MainArchive():const LoginScreen(),
          );
        },
        listener: (context, status) {
          if(status is SignInWithEmailSuccessStatus){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainArchive()));
          }
        });
  }
}


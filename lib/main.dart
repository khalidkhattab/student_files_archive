import 'package:filearchive/bloc/bloc_observer.dart';
import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/model.dart';
import 'package:filearchive/pages/archive_home.dart';
import 'package:filearchive/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/cubit_assits.dart';

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
      child: BlocConsumer<ArchiveCubit, CubitAssets>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light().copyWith(
              textTheme:
                  GoogleFonts.cairoTextTheme(Theme.of(context).textTheme.apply(
                        bodyColor: Colors.black,
                      )),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: SiteColor.bgColor2, secondary: SiteColor.bgColor),
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme:
                  GoogleFonts.cairoTextTheme(Theme.of(context).textTheme.apply(
                        bodyColor: Colors.white,
                      )),
            ),
            themeMode: ArchiveCubit.get(context).darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const Directionality(
                textDirection: TextDirection.rtl, child: MyHomePage()),
          );
        },
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
    return BlocConsumer<ArchiveCubit, CubitAssets>(builder: (context, status) {
      final cubit = ArchiveCubit.get(context);
      return  Scaffold(
        // drawer:
        // Drawer(
        //   child: ListView.builder(
        //       itemCount: drawerItem.length,
        //       itemBuilder: (context, index) {
        //         return Card(
        //           child: TextButton(
        //               onPressed: () {}, child: Text(drawerItem[index])),
        //         );
        //       }),
        // ),

        body:
            cubit.user!=null?const MainArchive():const LoginScreen(),
      );
    }, listener: (context, status) {
      if (status is SignInWithEmailSuccessStatus) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainArchive()));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:filearchive/bloc/cubit_assits.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchiveCubit extends Cubit<CubitAssets> {
  ArchiveCubit() : super(ArchiveInitStatus());
  static ArchiveCubit get(context) => BlocProvider.of(context);

  User? user = FirebaseAuth.instance.currentUser;

  Future signInWithEmailAndPassword(
      {required String email, required String password}) {
    emit(SignInWithEmailLoadingStatus());
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => emit(SignInWithEmailSuccessStatus()));
  }
}

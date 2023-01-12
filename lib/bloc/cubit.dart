import 'package:bloc/bloc.dart';
import 'package:filearchive/bloc/cubit_assits.dart';
import 'package:filearchive/model/model.dart';
import 'package:filearchive/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchiveCubit extends Cubit<CubitAssets> {
  ArchiveCubit() : super(ArchiveInitStatus());
  static ArchiveCubit get(context) => BlocProvider.of(context);
  bool darkMode = true;
  bool onBoardingDone = false;
  int currentPage = 0;
  bool onBoardingLess = true;
  User? user = FirebaseAuth.instance.currentUser;
  List<String> currentList = ['choose...............'];

  List<StudentData> currentClass = [];
  // String? classItem="Choose Item";

  List<String> dropDownItem = [
    'العاشر',
    'الحادي عشر ادبي',
    'الحادي عشر علمي',
    'الثاني عشر ادبي',
    'الثاني عشر علمي'
  ];
  // String? item = 'العاشر';
  // String? item2 ='10-1';

  List<String> classTen = [
    'choose...............',
    '10-1',
    '10-2',
    '10-3',
    '10-4',
    '10-5'
  ];
  List<String> classElevenD = [
    'choose...............',
    '11د1',
    '11د2',
    '11د3',
    '11د4'
  ];

  Future signInWithEmailAndPassword(
      {required String email, required String password}) {
    emit(SignInWithEmailLoadingStatus());
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => emit(SignInWithEmailSuccessStatus()));
  }

  darkModeOn() {
    darkMode = !darkMode;

    emit(ThemeSwitchStatus());
  }

  onBoardingChange(double? page) {
    if (page == 3) {
      onBoardingDone = true;
    } else {
      onBoardingDone = false;
    }

    if (page != 0) {
      onBoardingLess = false;
    } else {
      onBoardingLess = true;
    }
    emit(OnBoardingStatus());
  }

  changePage({required int index}) {
    currentPage = index;
    emit(PageChangeStatues());
  }

  refreshPage() {
    emit(PageRefresh());
  }

  currentDropDownList(String item) {
    if (item == 'العاشر') {
      currentList = classTen;
    }
    if (item == 'الحادي عشر ادبي') {
      currentList = classElevenD;
    }
    emit(PageRefresh());
  }

  showStudent(String clsses) {
    emit(ShowStudentDataLoadingStatus());
    currentClass =
        studentDataList.where((element) => element.sClass == clsses).toList();
    emit(ShowStudentDataSuccessStatus());
  }
}

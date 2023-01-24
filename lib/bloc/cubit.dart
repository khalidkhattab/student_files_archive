import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filearchive/bloc/cubit_assits.dart';
import 'package:filearchive/model/model.dart';
import 'package:filearchive/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ArchiveCubit extends Cubit<CubitAssets> {
  ArchiveCubit() : super(ArchiveInitStatus());
  static ArchiveCubit get(context) => BlocProvider.of(context);
  bool darkMode = true;
  bool onBoardingDone = false;
  int currentPage = 0;
  bool onBoardingLess = true;
  User? user = FirebaseAuth.instance.currentUser;
  List<String> currentList = ['choose...............'];

  List<StudentData> dataFromFirebase = [];

  List<StudentData> currentClass = [
    StudentData(
        name: 'choose...............',
        cId: '283021205454',
        cIdImage: 'assets/images/student.jpg',
        photo: 'assets/images/student.jpg',
        sClass: '10-1',
        nationality: 'kuwait',
        bDate: Timestamp.now(),
        guardianName: 'سيداحمد خطاب',
        guardianPhoto: 'assets/images/moveFile.png',
        guardianNationality: 'Kuwait',
        guardianAddress: 'Egypt',
        guardianJob: 'Father',
        guardianMaritalStatus: 'Maried',
        matherName: 'Set Alkel',
        matherAddress: 'Egypt',
        matherJob: 'angel',
        liveWith: 'famialy',
        reason: 'none'),
  ];

  List<StudentData> currentStudent = [];
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

  showCurrentStudents(String name) {
    emit(ShowCurrentStudentDataLoadingStatus());
    currentStudent =
        currentClass.where((element) => element.name == name).toList();
    emit(ShowCurrentStudentDataSuccessStatus());
  }

  addNewStudent({
    required String stage,
    required String sClass,
    required String cId,
  }) {
    emit(AddNewStudentDataLoadingStatus());
    StudentData model = StudentData(
        name: 'name',
        cId: 'cId',
        cIdImage: 'cIdImage',
        photo: 'photo',
        sClass: 'sClass',
        nationality: 'nationality',
        bDate: Timestamp.now(),
        guardianName: 'guardianName',
        guardianPhoto: 'guardianPhoto',
        guardianNationality: 'guardianNationality',
        guardianAddress: 'guardianAddress',
        guardianJob: 'guardianJob',
        guardianMaritalStatus: 'guardianMaritalStatus',
        matherName: 'matherName',
        matherAddress: 'matherAddress',
        matherJob: 'matherJob',
        liveWith: 'liveWith',
        reason: 'reason');
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(stage)
        .collection(sClass)
        .doc(cId)
        .set(model.toMap())
        .then((value) {
      emit(AddNewStudentDataSuccessStatus());
      getClassData(classNum: '10', currentClass: '101');

    }).catchError((error) {
      emit(AddNewStudentDataErrorStatus());
    });
  }

  getClassData({
    required String classNum,
    required String currentClass,
  }) {
    emit(GetStudentDataLoadingStatus());
    dataFromFirebase = [];
    StudentData model = StudentData(
        name: 'name',
        cId: 'cId',
        cIdImage: 'cIdImage',
        photo: 'photo',
        sClass: 'sClass',
        nationality: 'nationality',
        bDate: Timestamp.now(),
        guardianName: 'guardianName',
        guardianPhoto: 'guardianPhoto',
        guardianNationality: 'guardianNationality',
        guardianAddress: 'guardianAddress',
        guardianJob: 'guardianJob',
        guardianMaritalStatus: 'guardianMaritalStatus',
        matherName: 'matherName',
        matherAddress: 'matherAddress',
        matherJob: 'matherJob',
        liveWith: 'liveWith',
        reason: 'reason');
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(classNum)
        .collection(currentClass)
        .snapshots()
        .forEach((element) {
      dataFromFirebase = [];
      for (var ele in element.docs) {
        dataFromFirebase.add(StudentData.fromJson(ele.data()));
      }
    }).then((value) {
      emit(GetStudentDataSuccessStatus());
    }).catchError((error) {
      print(error.toString());
      emit(GetStudentDataErrorStatus(error.toString()));
    });
  }
  addNewClass({
    required String stage,
    required String collectionPath,
})async{
    emit(AddNewClassLoadingStatus());
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(stage).collection(collectionPath).add({
      'name':'name',
    }).then((value){
      emit(AddNewClassSuccessStatus());
    }).catchError((error){
      emit(AddNewClassErrorStatus());
    });
  }


  //test
  getClass({
    required String stage,
    required String collectionPath,
  }){
    emit(AddNewClassLoadingStatus());
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(stage).get();
  }

}


// final int documents = await FirebaseFirestore.instance
//     .collection('erea')
//     .doc('P9vRJwaBiiqCI022ND7T')
//     .collection('Schools')
//     .doc('9046')
//     .collection('class')
//     .doc(stage).collection(collectionPath).snapshots().length;
//
// if(documents==0){
//
// }else{
//   emit(AddNewClassErrorStatus());
// }
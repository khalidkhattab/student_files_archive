import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filearchive/bloc/cubit_assits.dart';
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

  List<String> allClass = [];

  //define current stage
  String stage = '10';

  List<String> currentList = ['choose...............'];

  List<StudentData> dataFromFirebase = [];



  List<String> dropDownItem = [
    'العاشر',
    'الحادي عشر ادبي',
    'الحادي عشر علمي',
    'الثاني عشر ادبي',
    'الثاني عشر علمي'
  ];


  List<String> classTen = [
    'choose...............',
  ];
  List<String> classElevenD = [
    'choose...............',
    '11د1',
    '11د2',
    '11د3',
    '11د4'
  ];



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



  Future signInWithEmailAndPassword(
      {required String email, required String password}) {
    emit(SignInWithEmailLoadingStatus());
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => emit(SignInWithEmailSuccessStatus()))
        .catchError((error) {
      emit(SignInWithEmailErrorStatus());
    });
  }

  addNewStudent({
    required String stage,
    required String sClass,
    required String cId,
  }) {
    emit(AddNewStudentDataLoadingStatus());
    StudentData model = StudentData(
        name: 'khalid khattab',
        cId: cId,
        cIdImage: 'cIdImage',
        photo: 'photo',
        sClass: sClass,
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
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(classNum)
        .collection(currentClass)
        .orderBy('name', descending: false)
        .snapshots()
        .forEach((element) {
      dataFromFirebase = [];
      for (var ele in element.docs) {
        dataFromFirebase.add(StudentData.fromJson(ele.data()));
      }
    }).then((value) {
      emit(GetStudentDataSuccessStatus());
    }).catchError((error) {
      emit(GetStudentDataErrorStatus(error.toString()));
    });
  }

  addNewClass({
    required String stage,
    required String collectionPath,
  }) async {
    emit(AddNewClassLoadingStatus());
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(stage)
        .collection(collectionPath)
        .add({
      'name': 'name',
    }).then((value) {
      emit(AddNewClassSuccessStatus());
    }).catchError((error) {
      emit(AddNewClassErrorStatus());
    });
  }



  getClassDataGet({
    required String classNum,
    required String currentClass,
  }) {
    emit(GetStudentDataLoadingStatus());
    dataFromFirebase = [];
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(classNum)
        .collection(currentClass)
        .orderBy('name', descending: false)
        .get()
        .then((value) {
      dataFromFirebase = [];
      for (var element in value.docs) {
        dataFromFirebase.add(StudentData.fromJson(element.data()));
      }
      emit(GetStudentDataSuccessStatus());
    }).catchError((error) {
      emit(GetStudentDataErrorStatus(error));
    });
  }

  allClassTitle() {
    allClass = [];
    for (var element in dataFromFirebase) {
      allClass.add(element.sClass);
    }
  }

  currentStage({required String lStage})  {
    if (lStage == "العاشر") {
      stage = '10';
    } else if (lStage == "الحادي عشر ادبي") {
      stage = '11D';
    } else if (lStage == "الحادي عشر علمي") {
      stage = '11A';
    } else if (lStage == "الثاني عشر ادبي") {
      stage = '12D';
    } else if (lStage == "الثاني عشر علمي") {
      stage = '12A';
    }
    getClassrooms(lClass: stage);
  }

  addClassroom({required String lClass, required List classRoom}) {
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(lClass)
        .set({'classroom': FieldValue.arrayUnion(classRoom)}).then(
            (value) => emit(PageRefresh()));
  }

  upDateClassroom({required String lClass, required List classRoom}) {
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(lClass)
        .update({'classroom': FieldValue.arrayUnion(classRoom)}).then(
            (value) => emit(PageRefresh()));
  }

  deleteClassroom({required String lClass, required List classRoom}) {
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(lClass)
        .update({'classroom': FieldValue.arrayRemove(classRoom)}).then(
            (value) => emit(PageRefresh()));
  }


  getClassrooms({
    required String lClass
}) {
    emit(GetStudentDataLoadingStatus());
    FirebaseFirestore.instance
        .collection('erea')
        .doc('P9vRJwaBiiqCI022ND7T')
        .collection('Schools')
        .doc('9046')
        .collection('class')
        .doc(lClass)
        .get()
        .then((value) {
      currentList = [
        'choose...............',
      ];
      for( var element in value.data()!['classroom']){
        currentList.add(element);
      }
      print(currentList);
      emit(GetClassroomSuccessStatus());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetClassroomErrorStatus());
    });
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentData {
  late String name;
  late String cId;
  late String cIdImage;
  late String photo;
  late String sClass;
  late String nationality;
  late Timestamp bDate;

  late String guardianName; //ولي الامر
  late String guardianPhoto;
  late String guardianNationality;
  late String guardianAddress;
  late String guardianJob;
  late String guardianMaritalStatus;

  late String matherName;
  late String matherAddress;
  late String matherJob;

  late String liveWith;
  late String reason;

  StudentData(
      {required this.name,
      required this.cId,
      required this.cIdImage,
      required this.photo,
      required this.sClass,
      required this.nationality,
      required this.bDate,
      required this.guardianName,
      required this.guardianPhoto,
      required this.guardianNationality,
      required this.guardianAddress,
      required this.guardianJob,
      required this.guardianMaritalStatus,
      required this.matherName,
      required this.matherAddress,
      required this.matherJob,
      required this.liveWith,
      required this.reason});

  StudentData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cId = json['cId'];
    cIdImage = json['cIdImage'];
    photo = json['photo'];
    sClass = json['sClass'];
    nationality= json['nationality'];
    bDate=json['bDate'];
    guardianName=json['guardianName'];
    guardianPhoto=json['guardianPhoto'];
    guardianNationality=json['guardianNationality'];
    guardianAddress= json['guardianAddress'];
   guardianJob= json['guardianJob'];
    guardianMaritalStatus=json['guardianMaritalStatus'];
    matherName= json['matherName'];
    matherAddress=json['matherAddress'];
   matherJob= json['matherJob'];
    liveWith= json['liveWith'];
    reason= json['reason'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cId': cId,
      'cIdImage': cIdImage,
      'photo': photo,
      'sClass': sClass,
      'nationality': nationality,
      'bDate':bDate,
      'guardianName': guardianName,
      'guardianPhoto': guardianPhoto,
      'guardianNationality': guardianNationality,
      'guardianAddress': guardianAddress,
      'guardianJob': guardianJob,
      'guardianMaritalStatus': guardianMaritalStatus,
      'matherName': matherName,
      'matherAddress': matherAddress,
      'matherJob': matherJob,
      'liveWith': liveWith,
      'reason': reason

    };
  }
}

List<StudentData> studentDataList = [
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
  StudentData(
      name: 'خالد سيداحمد خطاب',
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
  StudentData(
      name: 'هيثم سيداحمد خطاب',
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
  StudentData(
      name: 'حمادة سيداحمد خطاب',
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
  StudentData(
      name: 'choose...............',
      cId: '285021205454',
      cIdImage: 'assets/images/student.jpg',
      photo: 'assets/images/student.jpg',
      sClass: '10-2',
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
  StudentData(
      name: 'ايمن سيداحمد خطاب',
      cId: '285021205454',
      cIdImage: 'assets/images/student.jpg',
      photo: 'assets/images/student.jpg',
      sClass: '10-2',
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
      reason: 'none')
];



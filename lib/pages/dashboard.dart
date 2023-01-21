import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/model/user_model.dart';
import 'package:filearchive/pages/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_assits.dart';
import '../model/model.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String? item = ArchiveCubit().dropDownItem.first;
  String? item2 = ArchiveCubit().currentList.first;
  String? item3 = ArchiveCubit().currentClass.first.name;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArchiveCubit, CubitAssets>(
        builder: (context, state) {
          final cubit = ArchiveCubit.get(context);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              color: SiteColor.bgColor2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'احصائيات',
                      style: TextStyle(fontSize: 30),
                    ),
                    Row(
                      children: const [
                        ExpandContainer(
                          title: 'عدد الفصول',
                          body: '28',
                        ),
                        ExpandContainer(
                          title: 'عدد الطلاب',
                          body: '670',
                        ),
                        ExpandContainer(
                          title: 'الملفات الغير مكتملة',
                          body: '30',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150,
                      child: Card(
                        child: Container(
                          color: SiteColor.bgColor3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DropdownButton<String>(
                                        value: item ?? item,
                                        items: cubit.dropDownItem.map((e) {
                                          return DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(e),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          item2 = cubit.currentList.first;
                                          item = val;
                                          cubit.currentDropDownList(
                                              val.toString());
                                          print(cubit.currentList);
                                        }),
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DropdownButton<String>(
                                        value: item2,
                                        items: cubit.currentList.map((e) {
                                          return DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(e),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          item3 = cubit.currentClass.first.name;
                                          item2 = val;
                                          cubit.showStudent(item2!);
                                        }),
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DropdownButton<String>(
                                        value: item3,
                                        items: cubit.currentClass.map((e) {
                                          return DropdownMenuItem<String>(
                                            value: e.name,
                                            child: Text(e.name),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          item3 = val;
                                          cubit.showCurrentStudents(item3!);
                                        }),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                minWidth: 150,
                                height: 70,
                                onPressed: () {
                                  // cubit.showCurrentStudents(item3!);
                                  // print(cubit.currentStudent[0].guardianName);
                                  cubit.getClassData(
                                      classNum: '10', currentClass: '101');
                                  print(cubit.dataFromFirebase.length);
                                },
                                color: SiteColor.sideBarColor,
                                child: const Text('عرض'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    cubit.dataFromFirebase.isNotEmpty
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                                headingRowHeight: 80,
                                dataRowHeight: 80,
                                columnSpacing: 100,

                                // Datatable widget that have the property columns and rows.
                                columns: const [
                                  // Set the name of the column
                                  DataColumn(
                                    label: Text('الاسم'),
                                  ),
                                  DataColumn(
                                    label: Text('الرقم المدني'),
                                  ),
                                  DataColumn(
                                    label: Text('صورة الرقم المدني'),
                                  ),
                                  DataColumn(
                                    label: Text('صورة'),
                                  ),
                                  DataColumn(
                                    label: Text('الصف'),
                                  ),
                                  DataColumn(
                                    label: Text('الجنسية'),
                                  ),
                                  DataColumn(
                                    label: Text('تاريخ الميلاد'),
                                  ),
                                  DataColumn(
                                    label: Text('اسم ولي الامر'),
                                  ),
                                  DataColumn(
                                    label: Text(' صورة ولي الامر'),
                                  ),

                                  DataColumn(
                                    label: Text('عنوان ولي الامر'),
                                  ),
                                  DataColumn(
                                    label: Text('وظيفة ولي الامر'),
                                  ),
                                  DataColumn(
                                    label: Text('اسم الام'),
                                  ),

                                ],
                                rows: cubit.dataFromFirebase.map((e) {
                                  return DataRow(cells: [
                                    DataCell(Text(e.name)),
                                    DataCell(Text(e.cId)),
                                    DataCell(Text(e.cIdImage)),
                                    DataCell(Text(e.photo)),
                                    DataCell(Text(e.sClass)),
                                    DataCell(Text(e.nationality)),
                                    DataCell(Text(DateTime.fromMillisecondsSinceEpoch(e.bDate.millisecondsSinceEpoch ).toString())),
                                    DataCell(Text(e.guardianName)),
                                    DataCell(Text(e.guardianPhoto)),
                                    DataCell(Text(e.guardianAddress)),
                                    DataCell(Text(e.guardianJob)),
                                    DataCell(Text(e.matherName)),

                                  ]);
                                }).toList()),
                          )
                        : const Text('NO data')
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
// Column(
// children: [
// Container(
// height: 300,
// child: Card(
// child: Row(
// children: [
// Expanded(
// child: SizedBox(
// child: Column(
// children: [
// Text(
// cubit.dataFromFirebase[0].name,
// style: const TextStyle(
// fontSize: 25),
// ),
// ],
// )),
// ),
// Container(
// height: 300,
// width: 200,
// decoration: BoxDecoration(
// color: SiteColor.bgColor,
// image: const DecorationImage(
// image: AssetImage(
// 'assets/images/student.jpg'),
// fit: BoxFit.cover)),
// )
// ],
// ),
// )),
// Container(
// height: 300,
// child: Card(
// child: Row(
// children: [
// Expanded(
// child: SizedBox(
// child: Column(
// children: [
// Text(
// cubit.dataFromFirebase[0].name,
// style: const TextStyle(
// fontSize: 20),
// ),
// ],
// )),
// ),
// Container(
// height: 300,
// width: 200,
// decoration: BoxDecoration(
// color: SiteColor.bgColor,
// image: const DecorationImage(
// image: AssetImage(
// 'assets/images/student.jpg'),
// fit: BoxFit.cover)),
// )
// ],
// ),
// )),
// Container(
// height: 300,
// child: Card(
// child: Row(
// children: [
// Expanded(
// child: SizedBox(
// child: Column(
// children: [
// Text(
// cubit.dataFromFirebase[0].name,
// style: const TextStyle(
// fontSize: 20),
// ),
// ],
// )),
// ),
// Container(
// height: 300,
// width: 200,
// decoration: BoxDecoration(
// color: SiteColor.bgColor,
// image: const DecorationImage(
// image: AssetImage(
// 'assets/images/student.jpg'),
// fit: BoxFit.cover)),
// )
// ],
// ),
// )),
// ],
// )

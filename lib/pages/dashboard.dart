import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/pages/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/cubit_assits.dart';
import '../model/model.dart';

class DashBoard extends StatelessWidget {
  String? item = ArchiveCubit().dropDownItem.first;

  String? item2 = ArchiveCubit().currentList.first;

  String? item3 = ArchiveCubit().currentClass.first.name;

  DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArchiveCubit, CubitAssets>(
        builder: (context, state) {
          final cubit = ArchiveCubit.get(context);
          final kWidth = MediaQuery.of(context).size.width;

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                       kWidth>800? Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            ExpandContainer(
                              title: 'عدد الفصول',
                              body: '28',
                              width: kWidth*.25,
                            ),
                            ExpandContainer(
                              title: 'عدد الطلاب',
                              body: '670',
                              width: kWidth*.25,
                            ),
                            ExpandContainer(
                              title: 'الملفات الغير مكتملة',
                              body: '30',
                              width: kWidth*.25,
                            ),
                          ],
                        ):
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,

                         children:  [
                           ExpandContainer(
                             title: 'عدد الفصول',
                             body: '28',
                             width: kWidth*.6,
                           ),
                           ExpandContainer(
                             title: 'عدد الطلاب',
                             body: '670',
                             width: kWidth*.6,
                           ),
                           ExpandContainer(
                             title: 'الملفات الغير مكتملة',
                             body: '30',
                             width: kWidth*.6,
                           ),
                         ],
                       ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Container(
                              color: SiteColor.bgColor3,
                              child: kWidth > 1000
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
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
                                        Card(
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
                                                  item3 =
                                                      cubit.currentClass.first.name;
                                                  item2 = val;
                                                  cubit.showStudent(item2!);
                                                }),
                                          ),
                                        ),
                                        Card(
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
                                        MaterialButton(
                                          minWidth: 150,
                                          height: 70,
                                          onPressed: () {
                                            // cubit.showCurrentStudents(item3!);
                                            // print(cubit.currentStudent[0].guardianName);
                                            cubit.getClassData(
                                                classNum: '10',
                                                currentClass: '101');
                                            print(cubit.dataFromFirebase.length);
                                          },
                                          color: SiteColor.sideBarColor,
                                          child: const Text('عرض'),
                                        )
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
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
                                        Card(
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
                                                  item3 =
                                                      cubit.currentClass.first.name;
                                                  item2 = val;
                                                  cubit.showStudent(item2!);
                                                }),
                                          ),
                                        ),
                                        Card(
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
                                        MaterialButton(
                                          minWidth: 150,
                                          height: 70,
                                          onPressed: () {
                                            // cubit.showCurrentStudents(item3!);
                                            // print(cubit.currentStudent[0].guardianName);
                                            cubit.getClassData(
                                                classNum: '10',
                                                currentClass: '101');
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
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                    // headingRowHeight: 80,
                                    // dataRowHeight: 80,
                                    onSelectAll: (val) {},
                                    showBottomBorder: true,
                                    // Datatable widget that have the property columns and rows.
                                    columns: const [
                                      // Set the name of the column
                                      DataColumn(
                                        label: Text('صورة'),
                                      ),
                                      DataColumn(
                                        label: Text('الاسم'),
                                      ),
                                      DataColumn(
                                        label: Text('الرقم المدني'),
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
                                        label: Text('وظيفة ولي الامر'),
                                      ),
                                      DataColumn(
                                        label: Text('اسم الام'),
                                      ),
                                    ],
                                    rows: cubit.dataFromFirebase.map((e) {
                                      return DataRow(cells: [
                                        DataCell(Text(e.photo)),
                                        DataCell(Text(e.name)),
                                        DataCell(Text(e.cId)),
                                        DataCell(Text(e.sClass)),
                                        DataCell(Text(e.nationality)),
                                        DataCell(Text(DateFormat.yMd()
                                            .format(e.bDate.toDate()))),
                                        DataCell(Text(e.guardianName)),
                                        DataCell(Text(e.guardianJob)),
                                        DataCell(Text(e.matherName)),
                                      ]);
                                    }).toList()),
                              )
                            : const Text('NO data')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}

//DataCell(Text(DateTime.fromMillisecondsSinceEpoch(e.bDate.millisecondsSinceEpoch ).toString())),

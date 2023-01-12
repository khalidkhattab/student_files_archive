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
                                          item2 = val;
                                          cubit.refreshPage();
                                        }),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                minWidth: 150,
                                height: 70,
                                onPressed: () {
                                  cubit.showStudent(item2!);
                                  print(cubit.currentClass[0].guardianName);
                                },
                                color: SiteColor.sideBarColor,
                                child: const Text('عرض'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    cubit.currentClass.isNotEmpty?
                    Row(
                      children: [
                        Container(
                          height: 600,
                          width: 300,
                          child: ListView.builder(
                              itemCount:cubit.currentClass.length ,
                              itemBuilder: (context, index) {
                            return Card(
                              child: SizedBox(
                                  height: 50,
                                  child: Text(cubit.currentClass[index].name)),
                            );
                          }),
                        ),
                        Container(
                            width: 500,
                            child: Container(
                          color: SiteColor.bgColor,
                        ))
                      ],
                    ):const Text('data')
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}

import 'package:filearchive/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_assits.dart';
import '../model/model.dart';

class EditFile extends StatelessWidget {
  const EditFile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? item = ArchiveCubit().dropDownItem.first;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<ArchiveCubit, CubitAssets>(
          builder: (context, status) {
            final cubit = ArchiveCubit.get(context);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'تعديل الملفات',
                      style: TextStyle(fontSize: 30),
                    ),
                    Row(
                      children: [
                        Card(
                          child: SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: item,
                                  items: cubit.dropDownItem.map((e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    item = val;
                                    cubit.currentStage(lStage: val!);

                                    // cubit.currentDropDownList(
                                    //     val.toString());
                                    print(cubit.currentList);
                                  }),
                            ),
                          ),
                        ),
                        MaterialButton(
                          color: SiteColor.sideBarColor,
                          minWidth: 70,
                          height: 60,
                          onPressed: () {
                            if (cubit.currentList.length > 1) {
                              cubit.upDateClassroom(
                                  lClass: cubit.stage,
                                  classRoom: [
                                    '${cubit.stage}-${cubit.currentList.length}'
                                  ]);
                            } else {
                              cubit.addClassroom(
                                  lClass: cubit.stage, classRoom: ['10-1']);
                            }
                            cubit.currentStage(lStage: item!);
                          },
                          child: const Text('اضافة صف'),
                        )
                      ],
                    ),
                    Wrap(
                      children: cubit.currentList
                          .map((e) => InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        actionsAlignment: MainAxisAlignment.center,
                                            title: const Text('تنبية'),
                                            content:
                                                const Text('هل تريد حذف الصف'),
                                            actions: [
                                              MaterialButton(
                                                onPressed: () {
                                                  cubit.deleteClassroom(
                                                      lClass: cubit.stage,
                                                      classRoom: [e]);
                                                  cubit.getClassrooms(
                                                      lClass: cubit.stage);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('موافق'),
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('الغاء'),
                                              )
                                            ],
                                          ));
                                },
                                child: Card(
                                  child: Container(
                                    alignment: Alignment.center,

                                    height: 80,
                                    width: 100,
                                    child: Text(
                                      e,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            );
          },
          listener: (context, status) {}),
    );
  }
}

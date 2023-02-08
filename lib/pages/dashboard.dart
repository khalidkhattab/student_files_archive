import 'package:filearchive/bloc/cubit.dart';
import 'package:filearchive/pages/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_assits.dart';
import '../model/model.dart';

class DashBoard extends StatelessWidget {
  String? item = ArchiveCubit().dropDownItem.first;

  String? item2 = ArchiveCubit().currentList.first;


  DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArchiveCubit, CubitAssets>(
        builder: (context, state) {
          final cubit = ArchiveCubit.get(context);
          final kWidth = MediaQuery.of(context).size.width;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'إحصائيات',
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Wrap(
                      children:const [
                        ExpandContainer(
                          title: 'عدد الفصول',
                          body: '28',
                          width: 350,
                          icon: Icons.chair,
                        ),
                        ExpandContainer(
                          title: 'عدد الطلاب',
                          body: '670',
                          width: 350,
                          icon: Icons.person,
                        ),
                        ExpandContainer(
                          title: 'الملفات الغير مكتملة',
                          body: '30',
                          width: 350,
                          icon: Icons.file_copy,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 8,
                            child: Container(
                                color: SiteColor.bgColor3,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Wrap(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        child: SizedBox(
                                          width: 250,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: DropdownButton<String>(
                                                isExpanded: true,
                                                value: item ?? item,
                                                items:
                                                    cubit.dropDownItem.map((e) {
                                                  return DropdownMenuItem<String>(
                                                    value: e,
                                                    child: Text(e),
                                                  );
                                                }).toList(),
                                                onChanged: (val) {
                                                  item2 = cubit.classTen.first;
                                                  cubit.currentStage(
                                                      lStage: val!);
                                                  item = val;
                                                  // cubit.currentDropDownList(
                                                  //     val.toString());
                                                  print(cubit.currentList);
                                                }),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child: SizedBox(
                                          width: 250,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: DropdownButton<String>(
                                                isExpanded: true,
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MaterialButton(
                                          minWidth: 250,
                                          height: 70,
                                          onPressed: () {
                                            // cubit.showCurrentStudents(item3!);
                                            // print(cubit.currentStudent[0].guardianName);
                                            cubit.getClassDataGet(
                                                classNum: cubit.stage,
                                                currentClass: item2!);

                                          },
                                          color: SiteColor.mainColor,
                                          child: (state is GetStudentDataLoadingStatus)?const CircularProgressIndicator():const Text('عرض'),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      cubit.dataFromFirebase.isNotEmpty
                          ? SizedBox(
                              width: kWidth > 900 ? 800 : 450,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: cubit.dataFromFirebase.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: Container(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        height: 60,
                                        child: ListTile(
                                          selected: true,
                                          hoverColor: Colors.tealAccent,
                                          leading: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/student.jpg'),
                                          ),
                                          title: Row(
                                            children: [
                                              Text(cubit
                                                  .dataFromFirebase[index].name),
                                              const SizedBox(width: 20,),
                                              Text(cubit
                                                  .dataFromFirebase[index].cId),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(50.0),
                                  child: Column(
                                    children: const [
                                      Text('لايوجد طلاب', style: TextStyle(fontWeight: FontWeight.bold),),

                                      Text('استخدم شريط البحث لعرض النتائج'),
                                       SizedBox(height: 30,),
                                     Icon(Icons.search, size: 100,)
                                    ],
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}

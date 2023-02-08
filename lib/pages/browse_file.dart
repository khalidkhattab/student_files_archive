
import 'package:flutter/material.dart';

import '../model/model.dart';

class BrowseFile extends StatelessWidget {
  const BrowseFile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Text('استعراض الملفات', style: TextStyle(fontSize: 30),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 80,
            dataRowHeight: 80,
            columnSpacing: 100,

            // Datatable widget that have the property columns and rows.
              columns: const [
                // Set the name of the column
                DataColumn(label: Text('م'),),
                DataColumn(label: Text('صورة'),),
                DataColumn(label: Text('الاسم'),),
                DataColumn(label: Text('اسم ولي الامر'),),
                DataColumn(label: Text('تاريخ الميلاد'),),
              ],
              rows:const [
                // Set the values to the columns
                DataRow(cells: [
                  DataCell(Text("1")),
                  DataCell(CircleAvatar(
                    minRadius: 30,
                    backgroundImage: AssetImage('assets/images/student.jpg'),
                   )),
                  DataCell(Text("Alex")),
                  DataCell(Text("Anderson")),
                  DataCell(Text("18")),
                ]),
                DataRow(cells: [
                  DataCell(Text("2")),
                  DataCell(CircleAvatar(child: Image(image: AssetImage('assets/images/student.jpg')),)),
                  DataCell(Text("John")),
                  DataCell(Text("Anderson")),
                  DataCell(Text("24")),
                ]),
              ]
          ),
        ),

          ],),
      ),
    );
  }
}
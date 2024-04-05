import 'package:flutter/material.dart';
import 'package:todoapp/database_material/db_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbhelper = DataBaseUtil.instance;
 void  insertData()async{
     Map<String,dynamic> row = {
       DataBaseUtil.columnName: 'Amit',
       DataBaseUtil.columnAge : 25
     };
     int id = await dbhelper.insertData(row);
     print(id);
   }

 void getData ()async{
   var list = await dbhelper.queryData();
   for (var row in list) {
     print(row);
   }

 }

 void getSpecificData()async{
   var specificData = await dbhelper.querySpecific(26);
   specificData.forEach((item) { print(item); });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed:insertData, child: Text("Insert Data")),
            ElevatedButton(onPressed: getData, child: Text("Get Data")),
            ElevatedButton(onPressed: getSpecificData, child: Text("Get Specific Data")),
            ElevatedButton(onPressed: () {}, child: Text("Insert Data")),
          ],
        ),
      ),
    );
  }
}

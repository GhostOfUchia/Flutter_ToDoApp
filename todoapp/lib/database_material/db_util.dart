
import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseUtil{
  //  Step One -> creat basic info of our database

   static const _databaseName = "MyDataBase.db";  // database name
   static const  _databaseVersion = 1;  // database version
   static const tableName = "PersonInfo"; // our table name

 // Step two - > create our table columns name
   static const columnId = 'id';    // id column first column
   static const columnName = 'name';  // name column second column
   static const columnAge = 'age';   // age column third column

   static Database?  _database;  // database variable

 // these two lines inshore that our only one instance creat
   DataBaseUtil._privateConstructer();
   static final instance = DataBaseUtil._privateConstructer();

 // getter method for checking our database is null or not and get him
   Future<Database> get database  async{
     if(_database != null) return _database! ;

     _database = await _initDatabase();
     return _database!;
   }

   // initialize database directory path
   _initDatabase()async{
     Directory docomentdirectory =await getApplicationDocumentsDirectory();
     String path = join(docomentdirectory.path,_databaseName);
     return openDatabase(path,version: _databaseVersion,onCreate: _createDatabase);
   }
 // this _createDatabase  method actuality create our database
   Future _createDatabase(Database db,int version)async{
      await db.execute(
        '''    
        CREATE TABLE $tableName(   
        $columnId INTEGER PRIMARY KEY,  
        $columnName STRING NOT NULL,
        $columnAge INTEGER NOT NULL
        )
        '''
      );
   }

   // create our custom method
 //  Insert Method
Future<int> insertData(Map<String,dynamic>row) async{
     print("creation start");
     Database db = await instance.database;
     return db.insert(tableName,row);
}

// query all rows
Future<List<Map<String,dynamic>>> queryData()async{
     Database db = await instance.database;
     return db.query(tableName);
  }

// query specific data
Future<List<Map<String,dynamic>>> querySpecific(int age)async{
     Database db = await instance.database;
     var data = db.query(tableName,where:"age>?",whereArgs: [age]);
     return data;
}


}
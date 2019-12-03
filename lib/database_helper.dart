import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'data.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;
  
  String userTable='users';
  String colName='name';
  String colEmail='email';
  String colPassword='password';

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if(_databaseHelper==null){
      _databaseHelper=DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }


  Future<Database> get database async{
    if(_database==null){
      _database =await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    Directory applicationDirectory= await getApplicationDocumentsDirectory();
    String path=applicationDirectory.path+'users.db';
  
    var usersDatabase= await openDatabase(
      path,
      version: 1,
      onCreate:_createDb,
    );
    return usersDatabase;
  }
  
  void _createDb(Database db , int version)async{
    await db.execute('CREATE TABLE $userTable($colEmail TEXT PRIMARY KEY,$colName TEXT,$colPassword TEXT)');
  }

  Future <List<Map<String, dynamic>>> getUser(String email) async{
    Database db= await this.database;
    var result=await db.query(userTable,columns: [colEmail,colPassword],where: '$colEmail = ?',whereArgs: [email]);
    return result;
  }

  Future<int> putUser(Data data) async{
    Database db=await this.database;
    int result=await db.insert(userTable, data.fromDataToMap());
    return result;
  }
}
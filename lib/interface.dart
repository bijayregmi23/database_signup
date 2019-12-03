import 'database_helper.dart';
import 'data.dart';
import 'dart:async';

class Interface{
  DatabaseHelper helper=DatabaseHelper();

  addUser(String email, String name, String password)async{
    Data data=Data(email,name,password);
    int result= await this.helper.putUser(data);
    return result;
  }
  emailValidator(String email)async{
    List<Map<String,dynamic>> list=await this.helper.getUser(email);
    if(list.length!=0)
    {
      return 1;
    }
    else{
      return 0;
    }
  }
  passwordValidator(String email,String password)async{
    List<Map<String,dynamic>> list=await this.helper.getUser(email);
    if(list[0]['password']==password){
      return 1;
    }
    else{
      return 0;
    }    
  }
}
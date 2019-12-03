import 'dashboard.dart';
import 'package:flutter/material.dart';
import 'interface.dart';
import 'database_helper.dart';
import 'data.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
   _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

  Interface interface=Interface();
  String email='',password='';

  GlobalKey<FormState> _key =new GlobalKey();
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.tealAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(Icons.alternate_email),
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (input){
                      if(input.isEmpty){
                        return 'Email is empty';
                      }
                    },
                    onSaved: (input) => this.email=input,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(Icons.remove_red_eye),
                  title: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (input){
                      if(input.isEmpty){
                        return 'Password is empty';
                      }
                    },
                    onSaved: (input) => this.password=input,
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: (){
                  return login();
                },
              )
            ],
          ),
        ),
      ),       
    );
  }
  login() async{
    if(_key.currentState.validate()){
      _key.currentState.save();

      int result1 =await interface.emailValidator(this.email); //#########################//
      
      if(result1==1){
        int result2=await interface.passwordValidator(this.email,this.password); //#########################//
        if(result2==1){
            Navigator.push(context, 
            MaterialPageRoute(
              builder: (BuildContext context){
                return DashBoard(this.email);
              }
            )
          );
        }
        else{

        }          
      }
      else{

      }  
    }
  }
} 
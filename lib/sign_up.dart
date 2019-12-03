import 'dashboard.dart';
import 'package:flutter/material.dart';
import 'interface.dart';
import 'database_helper.dart';
import 'data.dart';
import 'dart:async';

class Signup extends StatefulWidget {
  @override
   _SignupState createState() => _SignupState();
}
class _SignupState extends State<Signup> {

  DatabaseHelper helper=DatabaseHelper();
  Interface interface=Interface();
  String email='',name='',password='';

  GlobalKey<FormState> _key =new GlobalKey();
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
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
                    onSaved: (input)=>this.email=input,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (input){
                      if(input.isEmpty){
                        return 'Name is empty';
                      }
                    },
                    onSaved: (input)=>this.name=input,
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
                      else if(input.length<6){
                        return 'Password must have 6 characters';
                      }
                      else{
                        this.password=input;
                      }
                    },
                    onSaved: (input)=>this.password=input,
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
                      labelText: 'Confirm Password',
                    ),
                    validator: (input){
                      if(this.password!=input){
                          return 'Password doesn Match';
                      }
                      else if(input.length<6){
                        return 'Password must have 6 characters';
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Signup'),
                  onPressed: signup ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  signup() async{
    if(_key.currentState.validate()){
      _key.currentState.save();

     int result =await interface.emailValidator(this.email); //#########################//
     if(result!=1){
      // Map<String,dynamic> map=await this.helper.getUser(email);
      // if(map['email']==this.email){
      
          await interface.addUser(this.email, this.name, this.password);
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
  }
} 
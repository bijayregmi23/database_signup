import 'package:flutter/material.dart';


class DashBoard extends StatefulWidget {
  final String userEmail;
  DashBoard(this.userEmail){}
  @override
  State<StatefulWidget> createState(){ 
    return _DashBoardState(this.userEmail);
  }
}

class _DashBoardState extends State<DashBoard> {
  final String email;

  _DashBoardState(this.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('Hello ${this.email}'),
      ),
      
    );
  }
}
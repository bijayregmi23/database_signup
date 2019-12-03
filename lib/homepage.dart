import 'package:flutter/material.dart';
import 'log_in.dart';
import 'sign_up.dart';

class HomePage extends StatefulWidget {
  @override
   _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  GlobalKey<FormState> _key= new GlobalKey();

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registraton'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('Login'),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context){
                      return Login();
                    }
                    )
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('Signup'),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (BuildContext context){
                        return Signup();
                      }
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

} 
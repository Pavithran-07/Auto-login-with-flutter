import 'package:flutter/material.dart';
import 'package:autologin/auth.dart';
import 'package:autologin/homePage.dart';

class loginPage extends StatefulWidget
{
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage>
{
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auto-Login')),
      body: Container(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text('Login'),
              RaisedButton(
                onPressed: (){
                  _auth.googleSignIn().then((value){
                    // print(object)
                    _auth.logIn().then((value1){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => homePage()));
                    });
                  });
                },
                child: Text('Login'),
              ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }

}
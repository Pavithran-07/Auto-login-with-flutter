import 'package:flutter/material.dart';
import 'package:autologin/auth.dart';
import 'package:autologin/homePage.dart';
import 'package:autologin/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: routePage(),
    );
  }
}


class routePage extends StatefulWidget
{
  @override
  routePageState createState() => routePageState();
}

class routePageState extends State<routePage>
{
  final AuthService _auth = AuthService();
  bool isLoggedin = false;
  @override
  void initState() {
    super.initState();
    print("Init state");
    _auth.autoLogin().then((value){
      if(value == 'null')
      {
        print(isLoggedin);
        setState(() {
          isLoggedin = false;
        });
      }
      else if(value !=null)
      {
        setState(() {
          isLoggedin = true;
        });
      }
      else{
        setState(() {
          isLoggedin = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedin==true ? homePage() : loginPage();
  }

}
// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_application_3/controller/textField.dart';
import 'package:flutter_application_3/model/authController.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username = "";
  String firstname = "";
  String lastname = "";
  String email = "";
  String password = "";

  var login = Auth();

  logIn() async {
    var date =
        await login.logIn(userNameController.text, passwordController.text);
    if (date["result"] == "not here") {
      Fluttertoast.showToast(
          msg: "User name or password is not correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
       SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', date["result"][0]['userName']);
      prefs.setString('email', date["result"][0]['email']);
      prefs.setString('firstname', date["result"][0]['firstName']);
      prefs.setString('lastname', date["result"][0]['lastName']);
      // prefs.setString('pic', date["result"][0]['pic']);
      
      Fluttertoast.showToast(
        
          msg: "Login successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
     

      Navigator.pushNamed(context, 'home/');

      //user.myProfile(userNameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.blueGrey,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Animate Biengs',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Sign In',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 100,
            child: TextFormField(
                controller: userNameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Enter your username",
                ),
                onChanged: (value) {
                  // change password text
                  username = value;
                }),
          ),
          SizedBox(
            height: 150,
            child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Enter your password",
                ),
                onChanged: (value) {
                  // change password text
                  password = value;
                }),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(00, 0, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  logIn();
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'Does not have account?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: TextButton(
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signUp');
                  },
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      )),
    );
  }
}

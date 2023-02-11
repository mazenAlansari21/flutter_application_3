// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/textField.dart';
import 'package:flutter_application_3/model/authController.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController confpasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();


  var auth = Auth();
  

  signup() async {
    if (userNameController == "" ||
        passwordController == "" ||
        emailController == "") {
      Fluttertoast.showToast(
          msg: "User name and password cannot be null",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      var date = await auth.signUp(userNameController.text,
          passwordController.text, emailController.text, firstNameController.text, lastNameController.text);
      if (date == "done") {
        Fluttertoast.showToast(
            msg: "Welcome Now you can log in",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushNamed(context, '/logIn');
      } else {
        Fluttertoast.showToast(
            msg: "User name alredy exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Animate Biengs',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 40),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: MyTextField(
                controller: userNameController,
                labeltext: "User Name",
                obscure: false,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: MyTextField(
                controller: emailController,
                obscure: false,
                labeltext: 'Email',
              ),
            ),
             Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: MyTextField(
                controller: firstNameController,
                obscure: false,
                labeltext: 'First Name',
              ),
            ),
             Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: MyTextField(
                controller: lastNameController,
                obscure: false,
                labeltext: 'Last Name',
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: MyTextField(
                controller: passwordController,
                obscure: true,
                labeltext: "Password",
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: MyTextField(
                controller: confpasswordController,
                obscure: true,
                labeltext: "Confirm Password",
              ),
            ),
            ElevatedButton(
              onPressed: () {
               
                  signup();
                 
              },
              child: Text(
                'Register',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
        ));
  }
}

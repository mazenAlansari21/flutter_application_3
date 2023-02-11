// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_3/controller/butoon.dart';
import 'package:flutter_application_3/model/authController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:profile/profile.dart';

class UProfile extends StatefulWidget {
  const UProfile({super.key});

  @override
  State<UProfile> createState() => _UProfileState();
}

class _UProfileState extends State<UProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myData();
  }

  var obj = Auth();
  var email, username, pic, firstname, lastname;
   TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();

  myData() async {
    await getdata();
  }

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      username = prefs.getString('username');
      firstname = prefs.getString('firstname');
      lastname = prefs.getString('lastname');
      // pic = prefs.getString('pic');
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  radius: 100.0,
                  // backgroundColor: Colors.blueGrey,
//                     backgroundImage:
// AssetImage ('img/me.jpeg'),
                ),
                SizedBox(
                  height: 10,
                ),

                // Text(
                //   "${firstname}".toUpperCase(),
                //   style: TextStyle(
                //     fontSize: 20.0,
                //     fontFamily: 'SourceSansPro',
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 2.5,
                //   ),
                // ),
                SizedBox(
                  height: 20.0,
                  width: 150,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                InkWell(
                    child: Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                        title: Text(
                          "${username}",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {}),
                InkWell(
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.assignment_ind_rounded,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        "${firstname}",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.assignment_ind_rounded,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        "${lastname}",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                    child: Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                        title: Text(
                          "${email}",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {}),
                    
              ],
         
            ),
          ),
        ));
  }
}

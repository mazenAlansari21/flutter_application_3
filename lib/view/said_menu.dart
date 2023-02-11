// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenu();
}

class _SideMenu extends State<SideMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myData();
  }

  var email, username, pic;

  myData() async {
    await getdata();
  }

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      username = prefs.getString('username');
      pic = prefs.getString('pic');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 280.0,
          height: 659,
          color: Colors.blueGrey,
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  //   backgroundImage:
                  //  AssetImage ('img/me.jpeg'),
                  backgroundColor: Colors.white24,
                  child: Icon(
                    CupertinoIcons.person,
                    color: Colors.white,
                  ),
                ),
                title: TextButton(
                  child: Text(
                    "${username}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                subtitle: Text(
                  "${email}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 400,
              ),
              ListTile(
                leading: IconButton(
                  iconSize: 35,
                  color: Colors.white,
                  icon: Icon(
                    Icons.info,
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/sideMenu');
                  },
                ),
                title: Text(
                  "About Us ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(),
               ListTile(
                leading: IconButton(
                  iconSize: 35,
                  color: Colors.white,
                  icon: Icon(
                    Icons.door_back_door_outlined,
                  ),
                  onPressed: () {
                  Navigator.pushNamed(context,'/logIn');
                  },
                ),
                title: Text(
                  "Log out ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

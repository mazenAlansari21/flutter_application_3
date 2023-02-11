// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/navBar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 20,
        backgroundColor: Colors.white,
        title: Text(
          "Animate Beings",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
        ),
        centerTitle: true,
        leading: IconButton(
          iconSize: 35,
          color: Colors.black,
          icon: Icon(
            Icons.person,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/sideMenu');
          },
        ),
        actions: [
          // IconButton(
          //   iconSize: 35,
          //   color: Colors.black,
          //   icon: Icon(
          //     Icons.settings,
          //   ),
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/sideMenu');
          //   },
          // ),
        ],
      ),
      body: 
        Column(
          children: [
        
            
            // Container(
              
            //   child: TableCalendar(
      
            //     firstDay: DateTime.utc(2022, 10, 16),
            //     lastDay: DateTime.utc(2030, 3, 14),
            //     focusedDay: today,
                
        
            //     // to remove to weeks from header  and make some design
            //     headerStyle: HeaderStyle(
            //       formatButtonDecoration: BoxDecoration(shape: BoxShape.rectangle),
            //         formatButtonVisible: false,
            //         titleCentered: true,
            //         decoration: BoxDecoration(color: Colors.blueGrey[200])),
            //   ),
            //   margin: EdgeInsets.symmetric(vertical: 11, horizontal: 11),
            //   padding: EdgeInsets.all(100),
            // ),
            
          ],
        ),
         bottomNavigationBar: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
           child: GNav(
                
                 // ignore: prefer_const_literals_to_create_immutables
                 tabs: [
            GButton(
              
              icon: Icons.home,
              text: "home",
              iconColor: Colors.black,
              iconSize: 25,
              
            ),
            GButton(
                icon: Icons.task,
                text: "task",
                iconColor: Colors.black,
                iconSize: 25),
            GButton(
                icon: Icons.search,
                text: "search",
                iconColor: Colors.black,
                iconSize: 25,
                onPressed: () {
                  Navigator.pushNamed(context, 'search');
                }),
               GButton(
                icon: Icons.person,
                text: "animal",
                iconColor: Colors.black,
                iconSize: 25,
                onPressed: () {
                  Navigator.pushNamed(context, 'MyAnimals');
                }),
                
                 ],
                 backgroundColor: Colors.grey, 
               ),
         )
     
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/Animal.dart';
import 'package:flutter_application_3/view/AnimalProfile.dart';
import 'package:flutter_application_3/view/chooseAnimal.dart';
import 'package:flutter_application_3/view/editInfo.dart';
import 'package:flutter_application_3/view/homePage.dart';
import 'package:flutter_application_3/view/login.dart';
import 'package:flutter_application_3/view/myAnimal.dart';
import 'package:flutter_application_3/view/profile.dart';
import 'package:flutter_application_3/view/said_menu.dart';
import 'package:flutter_application_3/view/search.dart';
import 'package:flutter_application_3/view/searchAnimal.dart';
import 'package:flutter_application_3/view/searchPlant.dart';
import 'package:flutter_application_3/view/signup.dart';
// import 'package:flutter_application_3/view/userprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
       LogIn(),
      routes: {
        'home/': (context) => const HomePage(),
        // '/search': (context) => const Search(),
        // '/AnimalSearch': (context) => const SearchForAnimal(),
        '/logIn': (context) => LogIn(),
        '/signUp': (context) => const SignUp(),
       '/profile': (context) => UProfile() ,
       '/sideMenu': (context) =>SideMenu(),
        '/edit': (context) =>EditInfo(),
         'createAnimalProfile':(context) => const CreateProfile(),
        'search':(context) => const search(),
        'searchPlant':(context) => const searchPlant(),
        'searchAnimal':(context) => const searchAnimal(),
        "chooseAnimal":(context) => const chooseAnimal(),
        'Animal':(context) => const Animal(),
        'MyAnimals':(context) => const MyAnimals(),
        // 'homePage':(context) => const homePage(),
      },
    );
  }
}

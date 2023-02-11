
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String data;
  final String rout;
  MyButton({Key? key, required this.data, required this.rout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ElevatedButton(
      child: Text(data),
      onPressed: () {
         Navigator.pushNamed(context, rout);
      },
    ));
  }
}
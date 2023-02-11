
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool obscure;
  final String labeltext;
  final TextEditingController controller;
 
  MyTextField({
    Key? key,
    required this.labeltext,
    required this.obscure, required this.controller,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(

controller: controller,
      obscureText: obscure,
      decoration: InputDecoration( 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: labeltext,
      ),
    );
  }
}
// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth {
  String userName = "";
  String password = "";
  String email = "";
  String firstName = "";
  String lastName = "";
  Auth();
  Auth.signup(
      this.userName, this.password, this.email, this.firstName, this.lastName);
  Auth.login(this.userName, this.password);
  Auth.data(this.userName);

  Future logIn(userName, password) async {
    this.userName = userName;

    var apiurl = "http://172.20.10.7/project/fun/login.php"; //api url

    var response = await http.post(Uri.parse(apiurl),
        body: {"userName": userName, "password": password});

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      return jsondata;
    }
  }

  Future signUp(userName, password, email, firstname, lastname) async {
    this.userName = userName;
    var apiurl = "http://172.20.10.7/project/fun/signup.php"; //api url

    var response = await http.post(Uri.parse(apiurl), body: {
      "userName": userName,
      "password": password,
      "email": email,
      "firstName": firstname,
      "lastName": lastname
    });

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      return jsondata;
    }
  }

  Future editdata(username, firstname, lastname, email) async {
    var apiurl = "http://172.20.10.7/project/fun/update.php"; //api url

    var response = await http.post(Uri.parse(apiurl), body: {
      "userName": username,
      "firstName": firstname,
      "lastName": lastname,
      "email": email,
    });

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      return jsondata;
    }
  }
}

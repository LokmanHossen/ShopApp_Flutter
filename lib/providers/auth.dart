// ignore_for_file: unused_field, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> _authentication(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDxu-9HCg2Q17pMUFxmZAb3jLrsVJ8mjvI');

    final response = await http.post(
      url,
      body: json.encode(
        {'email': email, 'password': password, 'returnsSecureToken': true},
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authentication(email, password, 'signUp');
    //   final url =Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDxu-9HCg2Q17pMUFxmZAb3jLrsVJ8mjvI');
    //  final response  = await http.post(
    //     url,
    //     body: json.encode(
    //       {
    //         'email': email,
    //         'password': password,
    //         'returnsSecureToken': true

    //       },
    //     ),
    //   );
    //   print(json.decode(response.body));
  }

  Future<void> login(String email, String password) async {
    return _authentication(email, password, 'signInWithPassword');
    // final url = Uri.parse(
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDxu-9HCg2Q17pMUFxmZAb3jLrsVJ8mjvI');

    // final response = await http.post(
    //   url,
    //   body: json.encode(
    //     {'email': email, 'password': password, 'returnsSecureToken': true},
    //   ),
    // );
    // print(json.decode(response.body));
  }
}

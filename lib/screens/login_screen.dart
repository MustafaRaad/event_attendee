// ignore_for_file: unnecessary_import, unused_import

import 'package:event_attendee/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../common/theme_helper.dart';
import '../widgets/header_widget.dart';
import '../api/base_api.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true),
            ),
            SafeArea(
                child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  const Text(
                    'Signing into your account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30.0),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Email', 'Enter Your Email'),
                            onChanged: (val) => setState(() => email = val),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                            child: TextField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Password', 'Enter your password'),
                              onChanged: (val) =>
                                  setState(() => password = val),
                            ),
                          ),
                          const SizedBox(height: 35.0),
                          Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  onPressed: () {
                                    getReq(context);
                                  },
                                  child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )))
                              //  () {
                              // Navigator.pushNamed(context, LoginScreen.LoginScreen.routeName);
                              // },
                              )
                        ],
                      ))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> getReq(BuildContext context) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://event.leftsphere.com/back/api/login'));
    request.fields.addAll({'email': email, 'password': '!@#app@test.com'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MyHomePage(customer: customer)));
    } else {
      print(response.reasonPhrase);
    }
  }
}

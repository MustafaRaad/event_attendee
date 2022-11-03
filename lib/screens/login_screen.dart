// ignore_for_file: unnecessary_import, unused_import

import 'package:event_attendee/repositry/auth_repo.dart';
import 'package:event_attendee/screens/profile_screen.dart';
import 'package:event_attendee/screens/qr_scan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../common/theme_helper.dart';
import '../models/auth_info.dart';
import '../models/user_info_model.dart';
import '../widgets/header_widget.dart';
import '../api/URL_paths.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final double _headerHeight = 250;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthRepo repo = AuthRepo();
  bool _isLoading = false;
  String _email = "app@test.com";
  String _password = "!@#app@test.com";
  bool _rememberMe = false, isSwitched = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _isLoading = false;
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

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
                            onChanged: (val) => setState(() => _email = val),
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
                                  setState(() => _password = val),
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
    assert(() {
      return true;
    }());
    try {
      if (_formKey.currentState!.validate()) {
        if (mounted) setState(() => _isLoading = true);
        _formKey.currentState?.save();
        if (mounted) setState(() => _isLoading = true);

        UserInfoModel user = await repo.login(_email, _password, _rememberMe);

        if (mounted) setState(() => _isLoading = false);

        repo.storeToken(user);

        var data = Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QrScanScreen(),
          ),
        );
      } else {
        if (mounted) print('else');
      }
    } catch (ll) {
      if (mounted) print(ll);
    }

    if (mounted) setState(() => _isLoading = false);
  }
}

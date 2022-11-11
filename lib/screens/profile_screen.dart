// ignore: unnecessary_import
import 'package:event_attendee/models/profile_model.dart';
import 'package:event_attendee/models/user_info_model.dart';
import 'package:event_attendee/screens/qr_scan_screen.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './login_screen.dart';
import './splash_screen.dart';
import '../widgets/header_widget.dart';
import '../api/auth_api.dart';

class ProfileScreen extends StatefulWidget {
  final String userIdFromQr;
  const ProfileScreen(this.userIdFromQr, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final api = AuthenticationAPI();
  // final double _drawerIconSize = 24;
  // final double _drawerFontSize = 17;
  bool circular = true;
  ProfileModel profileModel = ProfileModel(data: [userIdFromQr]);

  @override
  void initState() {
    super.initState();
    String userIdFromQr = widget().userIdFromQr;
    fetchData(userIdFromQr);
  }

  void fetchData(userIdFromQr) async {
    api.getUserInfofromAPI(userIdFromQr);
    setState(() {
      profileModel = ProfileModel.fromJson(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text(
        //   "Profile Page",
        //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
        // actions: [
        //   Container(
        //     margin: const EdgeInsets.only(
        //       top: 16,
        //       right: 16,
        //     ),
        //     child: Stack(
        //       children: <Widget>[
        //         const Icon(Icons.notifications),
        //         Positioned(
        //           right: 0,
        //           child: Container(
        //             padding: const EdgeInsets.all(1),
        //             decoration: BoxDecoration(
        //               color: Colors.red,
        //               borderRadius: BorderRadius.circular(6),
        //             ),
        //             constraints: const BoxConstraints(
        //               minWidth: 12,
        //               minHeight: 12,
        //             ),
        //             child: const Text(
        //               '5',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 8,
        //               ),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false),
            ),
            Container(
              alignment: Alignment.center,
              // margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(100),
                    //   border: Border.all(width: 5, color: Colors.white),
                    //   color: Colors.white,
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.black12,
                    //       blurRadius: 20,
                    //       offset: const Offset(5, 5),
                    //     ),
                    //   ],
                    // ),
                    child: const Text(
                      'Your Event Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.white),
                    ),
                    // child: Icon(
                    //   Icons.person,
                    //   size: 80,
                    //   color: Colors.grey.shade300,
                    // ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        const ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          leading: Icon(Icons.person, size: 30),
                                          title: Text("Name"),
                                          subtitle: Text("Mustafa"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.email, size: 30),
                                          title: Text("Email"),
                                          subtitle: Text("Ofy@gmail.com"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.phone, size: 30),
                                          title: Text("Phone"),
                                          subtitle: Text("7705675477"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.person, size: 30),
                                          title: Text("About Me"),
                                          subtitle: Text(
                                              "This is a about me link and you can khow about me in this section."),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
  ProfileModel? profileModel;

  @override
  void initState() {
    super.initState();
    String userIdFromQr = widget().userIdFromQr;
    fetchData(userIdFromQr);
  }

  void fetchData(userIdFromQr) async {
    var data = await api.getUserInfofromAPI(userIdFromQr);
    setState(() {
      if (data != null) {
        profileModel = data;
      } else {
        print('error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: profileModel == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Stack(
                children: [
                  const SizedBox(
                    height: 150,
                    child: HeaderWidget(150, false),
                  ),
                  Container(
                    alignment: Alignment.center,
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
                                              ListTile(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12,
                                                          vertical: 6),
                                                  leading: const Icon(
                                                      Icons.person,
                                                      size: 30),
                                                  title:
                                                      const Text('Full Name'),
                                                  subtitle: Text(
                                                      '${profileModel!.data!.title} ${profileModel!.data!.nameFirst} ${profileModel!.data!.nameSecond} ${profileModel!.data!.nameLast}'),
                                                  trailing: Text(
                                                      'ID: ${profileModel!.data!.id}')),
                                              ListTile(
                                                leading: const Icon(Icons.email,
                                                    size: 30),
                                                title: const Text("Email"),
                                                subtitle: Text(
                                                    "${profileModel!.data!.email}"),
                                              ),
                                              ListTile(
                                                leading: const Icon(Icons.phone,
                                                    size: 30),
                                                title: const Text("Phone"),
                                                subtitle: Text(
                                                    "${profileModel!.data!.phone}"),
                                              ),
                                              ListTile(
                                                leading: const Icon(Icons.place,
                                                    size: 30),
                                                title: const Text("Place"),
                                                subtitle: Text(
                                                    "${profileModel!.data!.country} - ${profileModel!.data!.governorate}"),
                                              ),
                                              ListTile(
                                                  leading: const Icon(
                                                      Icons.account_balance,
                                                      size: 30),
                                                  title: const Text("Facility"),
                                                  subtitle: Text(
                                                      "${profileModel!.data!.facility}"),
                                                  isThreeLine: true),
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

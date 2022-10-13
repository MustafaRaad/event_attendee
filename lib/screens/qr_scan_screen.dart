import 'package:flutter/material.dart';

import '../common/theme_helper.dart';
import '../widgets/header_widget.dart';

class QrScanScreen extends StatelessWidget {
  const QrScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        // title: const Text(
        //   "Profile Page",
        //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // ),
        // elevation: 0,
        // iconTheme: const IconThemeData(color: Colors.white),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight,
        //           colors: <Color>[
        //         Theme.of(context).primaryColor,
        //         Theme.of(context).colorScheme.secondary,
        //       ])),
        // ),
        // ),
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              height: 500,
              alignment: Alignment.center,
              child: Icon(
                Icons.qr_code_scanner_rounded,
                size: 250,
                color: Colors.grey.shade500,
              )),
          Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QrScanScreen(),
                        ));
                  },
                  child: const Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(
                        'Scan QR',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))))
        ],
      ),
    ));
  }
}


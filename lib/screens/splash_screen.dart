import 'package:event_attendee/repositry/auth_repo.dart';
import 'package:event_attendee/screens/profile_screen.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:event_attendee/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthRepo repo = AuthRepo();
  late bool isLoading;
  @override
  void initState() {
    isLoading = false;
    super.initState();
    moveToLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void moveToLogin() async {
    try {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      await repo.checkIfLoggedIn().then((value) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
      });

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
    // _SplashScreenState() {
    //   Timer(const Duration(seconds: 2), () {
    //     setState(() {
    //       Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(builder: (context) => const LoginScreen()),
    //           (route) => false);
    //     });
    //   });
    //   Timer(const Duration(milliseconds: 10), () {
    //     setState(() {
    //       _isVisible = true;
    //     });
    //   });
  }

// static const String _imgUrl = 'logo.png';
  @override
  Widget build(BuildContext context) {
    //  new Future.delayed(const Duration(seconds: 2), () {
    //   moveToLogin();
    // });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text("جاري محاولة تسجيل الدخول ... الرجاء الانتظار"),
          const SizedBox(
            height: 20,
          ),
          isLoading ? const CircularProgressIndicator() : Container()
        ],
      ),
    );
  }
}
// Widget build(BuildContext context) {
//   return Container(
//     decoration: const BoxDecoration(
//         gradient: LinearGradient(
//             colors: [
//               Colors.teal,
//               Colors.purple,
//               // Theme.of(context).primaryColor
//               // Theme.of(context).colorScheme.secondary,
//             ],
//             begin: FractionalOffset(0, 0),
//             end: FractionalOffset(1.7, 0.4),
//             stops: [0.0, 1.0],
//             tileMode: TileMode.clamp)),
    // child: AnimatedOpacity(
    // opacity: _isLoading ? 1.0 : 0,
    // duration: const Duration(microseconds: 1200),
  //   child: Center(
  //     child: Container(
  //         height: 200.0,
  //         width: 200.0,
  //         padding: const EdgeInsets.all(15.0),
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           color: Colors.white,
  //           boxShadow: [
  //             BoxShadow(
  //                 blurRadius: 10.0,
  //                 color: Colors.white.withOpacity(0.7),
  //                 offset: const Offset(0.0, 0.0),
  //                 spreadRadius: 2.0)
  //           ],
  //         ),
  //         child: Container(
  //           decoration: const BoxDecoration(
  //             image: DecorationImage(
  //               image: AssetImage('assets/logo.png'),
  //               fit: BoxFit.contain,
  //               alignment: Alignment.topCenter,
  //             ),
  //           ),
  //         )),
  //   ),
  //   // )
  // );
// }
// }

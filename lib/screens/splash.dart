import 'package:eduyaari02/screens/auth/login_screen.dart';
import 'package:eduyaari02/screens/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {

  static const String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 3),
            () => Get.to(LoginScreen()));
       }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white
            // gradient: mainGradient(context)
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset('assets/images/splash_logo.png'),
        ),
      ),
    );
  }
}

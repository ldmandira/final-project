import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'landing_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LandingPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 300,width: 300,child: Lottie.asset("assets/splash.json"),)
          ],
        ),
      ),
    );
  }
}

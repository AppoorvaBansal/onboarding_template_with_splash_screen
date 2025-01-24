
import 'package:flutter/material.dart';
import 'package:onboarding_template/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  // Check if onboarding is completed and navigate accordingly
  _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isOnboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;

    // Wait for 3 seconds and then navigate to the next screen
    await Future.delayed(Duration(seconds: 10));

    if (isOnboardingCompleted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>LoginPage() ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ( Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),


    )

    );
  }
}

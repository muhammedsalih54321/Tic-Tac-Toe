import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/Ui/Onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    _navigateotherscreen();
  }

  _navigateotherscreen() async {
    await Future.delayed(Duration(seconds: 3), () async {
     
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnboardScreen()));
  
    });
  }
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/Logo.png',
          width: 180.39.w,
          height: 201.12.h,
        ),
      ),
    );
  }
}

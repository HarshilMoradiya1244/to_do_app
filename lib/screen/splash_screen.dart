import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange.shade200,
        body: Center(
        child: Image.asset("assets/image/to-do.jpg"),
        ),
      ),
    );
  }
}

import 'package:car_rental_app/presentation/pages/onboarding_pages.dart';
import 'package:flutter/material.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
   void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  // Navigate to the home page after the splash duration
  void _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 3)); // Splash duration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingPages()), // Navigate to HomePage
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 66, 163),
      body: Center(child: Text("RENTCAR",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36),),),
    );
  }
}
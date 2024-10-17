import 'package:car_rental_app/presentation/pages/cardetails_page.dart';
import 'package:car_rental_app/presentation/pages/home_page.dart';
import 'package:car_rental_app/presentation/pages/login_page.dart';
import 'package:car_rental_app/presentation/pages/onboarding_pages.dart';
import 'package:car_rental_app/presentation/pages/otpverfication_pages.dart';
import 'package:car_rental_app/presentation/pages/register_page.dart';
import 'package:car_rental_app/presentation/pages/spalsh_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {

   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      initialRoute: '/',
    routes: {
      
      '/':(context) =>SpalshPage(),
      '/onboard':(Context)=>OnboardingPage(),
      '/otpPage': (context) => OTPRequestPage(),
      '/verifyOTP': (context) => OTPVerificationPage(),
      '/register': (context) => RegistrationPage(),
      '/home': (context) => HomePage(),
      // '/details': (context) => CarDetailsPage(car: cars[index]),
    },
     
    );
  }
}



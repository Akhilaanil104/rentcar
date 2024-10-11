import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;
  String _verificationId = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get verificationId from arguments passed from the previous page
    _verificationId = ModalRoute.of(context)?.settings.arguments as String;
  }

  // Verifying OTP
  Future<void> _verifyOTP() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text,
      );
      await _auth.signInWithCredential(credential);
      setState(() {
        _isLoading = false;
      });
      // Navigate to home or dashboard
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ONBORADINGIMG.jpeg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6), // Dark overlay
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Enter the OTP sent to your phone',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: _otpController,
                      decoration: InputDecoration(
                        hintText: 'Enter OTP',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _verifyOTP,
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : Text('Verify OTP'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button color
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

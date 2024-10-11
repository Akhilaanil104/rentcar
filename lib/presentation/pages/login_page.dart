// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class OTPLoginPage extends StatefulWidget {
//   @override
//   _OTPLoginPageState createState() => _OTPLoginPageState();
// }

// class _OTPLoginPageState extends State<OTPLoginPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _otpController = TextEditingController();

//   String _verificationId = '';
//   bool _isCodeSent = false;
//   bool _isLoading = false;

//   // Sending OTP to the given phone number
//   Future<void> _sendOTP() async {
//     setState(() {
//       _isLoading = true;
//     });

//     await _auth.verifyPhoneNumber(
//       phoneNumber: _phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         // Auto-retrieve or instant verification for specific devices
//         await _auth.signInWithCredential(credential);
//         setState(() {
//           _isLoading = false;
//         });
//         // Navigate to home or dashboard
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         setState(() {
//           _isLoading = false;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Verification failed. Please try again.')),
//         );
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         setState(() {
//           _verificationId = verificationId;
//           _isCodeSent = true;
//           _isLoading = false;
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         _verificationId = verificationId;
//       },
//     );
//   }

//   // Verifying OTP
//   Future<void> _verifyOTP() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId,
//         smsCode: _otpController.text,
//       );
//       await _auth.signInWithCredential(credential);
//       setState(() {
//         _isLoading = false;
//       });
//       // Navigate to home or dashboard
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Invalid OTP. Please try again.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/ONBORADINGIMG.jpeg'), // Add your background imageassets\images\ONBORADINGIMG.jpeg
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Dark overlay for better contrast
//           Container(
//             color: Colors.black.withOpacity(0.6),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       'Login with OTP',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     _isCodeSent
//                         ? Column(
//                             children: [
//                               Text(
//                                 'Enter the OTP sent to your phone',
//                                 style: TextStyle(color: Colors.white70),
//                               ),
//                               SizedBox(height: 10),
//                               TextField(
//                                 controller: _otpController,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter OTP',
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 keyboardType: TextInputType.number,
//                               ),
//                               SizedBox(height: 20),
//                               ElevatedButton(
//                                 onPressed: _verifyOTP,
//                                 child: _isLoading
//                                     ? CircularProgressIndicator()
//                                     : Text('Verify OTP'),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue, // Button color
//                                   padding: EdgeInsets.symmetric(vertical: 15),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : Column(
//                             children: [
//                               Text(
//                                 'Enter your phone number',
//                                 style: TextStyle(color: Colors.white70),
//                               ),
//                               SizedBox(height: 10),
//                               TextField(
//                                 controller: _phoneController,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter phone number',
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 keyboardType: TextInputType.phone,
//                               ),
//                               SizedBox(height: 20),
//                               ElevatedButton(
//                                 onPressed: _sendOTP,
//                                 child: _isLoading
//                                     ? CircularProgressIndicator()
//                                     : Text('Send OTP'),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue, // Button color
//                                   padding: EdgeInsets.symmetric(vertical: 15),
//                                 ),
//                               ),
//                             ],
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






















import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPRequestPage extends StatefulWidget {
  @override
  _OTPRequestPageState createState() => _OTPRequestPageState();
}

class _OTPRequestPageState extends State<OTPRequestPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

  // Sending OTP to the given phone number
  Future<void> _sendOTP() async {
    setState(() {
      _isLoading = true;
    });

    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve or instant verification for specific devices
        await _auth.signInWithCredential(credential);
        setState(() {
          _isLoading = false;
        });
        // Navigate to home or dashboard
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed. Please try again.')),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushNamed(
          context,
          '/verifyOTP',
          arguments: verificationId, // Passing the verificationId to the next page
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
                      'Login with OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Enter your phone number',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _sendOTP,
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : Text('Send OTP'),
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

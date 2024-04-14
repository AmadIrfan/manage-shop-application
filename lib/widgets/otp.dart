// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../pages/home.dart';

class OTPScreen extends StatefulWidget {
  final String phone;

  const OTPScreen({required this.phone, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify ${widget.phone}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              length: 6,
              smsCodeMatcher: PinputConstants.defaultSmsCodeMatcher,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              defaultPinTheme: defaultPinTheme,
              controller: _pinPutController,
              pinAnimationType: PinAnimationType.fade,
              onCompleted: (v) {
                if (kDebugMode) {
                  print(v);
                }
              },
              onSubmitted: (pin) async {
                try {
                  if (kDebugMode) {
                    print('Submit');
                    print(pin);
                  }
                  _verifyPhone();
                  // await FirebaseAuth.instance
                  //     .signInWithCredential(PhoneAuthProvider.credential(
                  //         verificationId: _verificationCode!, smsCode: pin))
                  //     .then((value) async {
                  //   if (value.user != null) {
                  //     Navigator.pushAndRemoveUntil(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => Home()),
                  //         (route) => false);
                  //   }
                  // });
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    // await FirebaseAuth.instance.verifyPhoneNumber(
    //     phoneNumber: '${widget.phone}',
    //     verificationCompleted: (PhoneAuthCredential credential) async {
    //       await FirebaseAuth.instance
    //           .signInWithCredential(credential)
    //           .then((value) async {
    if (kDebugMode) {
      print('submit');
    }
    //        if (value.user != null) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
    // }
    //       });
    //     },
    //     verificationFailed: (FirebaseAuthException e) {
    //       print(e.message);
    //     },
    //     codeSent: (String? verificationID, int? resendToken) {
    //       setState(() {
    //         _verificationCode = verificationID;
    //       });
    //     },
    //     codeAutoRetrievalTimeout: (String verificationID) {
    //       setState(() {
    //         _verificationCode = verificationID;
    //       });
    //     },
    //     timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../widgets/otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  String countryCode = '+92';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: const Center(
                  child: Text(
                    'Phone Authentication',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        showFlag: false,
                        showFlagDialog: true,
                        initialSelection: countryCode,
                        onChanged: (v) {
                          setState(() {
                            countryCode = v.code!;
                          });
                        },
                        onInit: (c) {
                          if (kDebugMode) {
                            print(c);
                          }
                        },
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                          ),
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          controller: _controller,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        OTPScreen(phone: countryCode + _controller.text),
                  ),
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

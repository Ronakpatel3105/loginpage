// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage_firebase/myLoginPage.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgotpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              child: Lottie.asset('assets/images/animation.json'),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: forgotpasswordController,
                decoration: const InputDecoration(
                  hintText: ('Email Id'),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  var forgotPass = forgotpasswordController.text.trim();
                  try {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgotPass)
                        .then((value) => {
                              print('Email send'),
                              Get.off(() => const MyLoginPage())
                            });
                  } on FirebaseAuthException catch (e) {
                    print('Error  $e');
                  }
                },
                child: const Text('Forgot Password')),
          ]),
        ),
      ),
    );
  }
}

// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_firebase/myLoginPage.dart';
import 'package:loginpage_firebase/signupService.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userphoneNumberController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up'), centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              height: 200,
              child: Lottie.asset('assets/images/animation.json'),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: userphoneNumberController,
                decoration: const InputDecoration(
                  hintText: 'Mobile No',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: useremailController,
                decoration: const InputDecoration(
                  hintText: 'Email Id',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: userpasswordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  var userName = userNameController.text.trim();
                  var userMobileNo = userphoneNumberController.text.trim();
                  var userEmail = useremailController.text.trim();
                  var userPass = userpasswordController.text.trim();

                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: userEmail, password: userPass)
                      .then((value) => {log('user created')});

                  signupUser(
                    userName,
                    userMobileNo,
                    userEmail,
                    userPass,
                  );
                },
                child: const Text('Sign up')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyLoginPage(),
                      ));
                },
                child: const Text('Already Have an Account? Login')),
          ]),
        ),
      ),
    );
  }
}

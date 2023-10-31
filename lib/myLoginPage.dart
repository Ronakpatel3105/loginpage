// ignore_for_file: unused_local_variable, avoid_print, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage_firebase/forgotpassword.dart';
import 'package:loginpage_firebase/homepage.dart';
import 'package:loginpage_firebase/signupscreen.dart';
import 'package:lottie/lottie.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login Page'),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: Lottie.asset("assets/images/animation.json")),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: loginEmailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline_outlined),
                    hintText: 'Email Id',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: loginPasswordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    var loginEmail = loginEmailController.text.trim();
                    var loginPass = loginPasswordController.text.trim();
                    try {
                      final User? FirebaseUser = (await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: loginEmail, password: loginPass)).user;

                      if (FirebaseUser != null) {
                        Get.to(() => const HomePage());
                      } else {
                        print('Check Email & Password');
                      }
                    } on FirebaseAuthException catch (e) {
                      print('Error  $e');
                    }
                  },
                  child: const Text('Login')),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ));
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: const Text(
                    "Don't have an account? Signup",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

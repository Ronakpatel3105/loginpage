

import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_firebase/myLoginPage.dart';



signupUser(String userName, String userMobileNo, String userEmail,
    String userPass) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection('users').doc(userid!.uid).set({
      'userName': userName,
      'userMobileNo': userMobileNo,
      'userEmail': userEmail,
      'createdAt': DateTime.now(),
      'userId': userid.uid,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          Navigator.push(
              context as BuildContext,
              MaterialPageRoute(
                builder: (context) => const MyLoginPage(),
              ))
        });
  } on FirebaseAuthException catch (e) {
    print('Error $e');
  }
}

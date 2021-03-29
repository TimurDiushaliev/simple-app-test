import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationService {
  static Stream<User> get authStateChanged =>
      FirebaseAuth.instance.authStateChanges();
  static Future<String> signIn(
      {@required String email, @required String password}) async {
    try {
      FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'successfully signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<String> signUp(
      {@required String email, @required String password}) async {
    try {
      FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'successfully signed up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}

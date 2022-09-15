import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/view/widgets/BottomNavigationBarResaurent.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  bool isLoggin = false;

  Future gooleSignOUt() async {
    await googleSignIn.signOut();
  }

  googleLogin(context) async {
    try {
      isLoggin = true;
      notifyListeners();
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }
      _user = googleUser;
//
      final googleAuth = await _user!.authentication;
      // log(_user.toString());

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      log(credential.toString());

      await FirebaseAuth.instance.signInWithCredential(credential);
      showDialog(
          context: context,
          builder: (context) => const Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationBarResaurent(),
          ));
      isLoggin = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}

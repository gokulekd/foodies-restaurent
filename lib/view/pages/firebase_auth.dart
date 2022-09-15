
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/controller/googlesignin.dart';
import 'package:foodies_restaurent/view/pages/srcreen_login.dart';
import 'package:foodies_restaurent/view/widgets/BottomNavigationBarResaurent.dart';

class FirebaseAuth extends StatelessWidget {
  const FirebaseAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GoogleSignInProvider().googleLogin(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNavigationBarResaurent();
          } else {
            return  ScreenLogin();
        }
        }
      )
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart' as model;
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/view/pages/srcreen_login.dart';
import 'package:foodies_restaurent/view/widgets/BottomNavigationBarResaurent.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: Column(
          children: [
            sizeH10,
            SizedBox(
              height: 150,
              width: 250,
              child: Image.asset(foodiesLogoImage),
              // color: kred,
            ),
            Text(
              "Burger",
              style: GoogleFonts.fredokaOne(fontSize: 40, color: loginColor),
            ),
            sizeH60,
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(splashMainLogo),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Lottie.asset(splashLoadingJson),
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigate(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StreamBuilder(
          stream: model.FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              print("connection state acitive");
              if (snapshot.hasData) {
                return const BottomNavigationBarResaurent();
              }
            }

            return  ScreenLogin();
          },
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/controller/email_signin.dart';
import 'package:foodies_restaurent/controller/googlesignin.dart';
import 'package:foodies_restaurent/view/pages/srcreen_login.dart';
import 'package:foodies_restaurent/view/widgets/show%20more%20commen%20widget/widgets/customerDetailsWidgetShowMoreOders.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: kwhite,
        title: Text(
          "Admin Profile Page",
          style: googleNormalFont,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Image.asset(foodiesLogoImage),
              // color: kred,
            ),
            Center(
              child: Text("Burger",
                  style:
                      GoogleFonts.fredokaOne(fontSize: 40, color: loginColor)),
            ),
            sizeH20,
            customerDetailsWidgetShowMoreOders(heightMedia, widthMedia),
            sizeH20,
            Column(
              children: [
                Text(
                  "Total Sale Today",
                  style: googleNormalFont,
                ),
                sizeH20,
                const Text(
                  "5789",
                  style: TextStyle(
                    fontSize: 25,
                    color: kgreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizeH40,
                Text(
                  "Total orders today ",
                  style: googleNormalFont,
                ),
                sizeH20,
                const Text(
                  "56",
                  style: TextStyle(
                    fontSize: 25,
                    color: kgreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizeH20,
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: kred,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    log(FirebaseAuth.instance.currentUser!.uid.isEmpty
                        .toString());
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    Provider.of<GoogleSignInProvider>(context, listen: false)
                        .gooleSignOUt();
                        EmailSignin().logout();

                  Get.to(()=>ScreenLogin());
                  },
                  icon: const Icon(Icons.cancel),
                  label: const Text("Log Out")),
            ),
          ],
        ),
      ),
    );
  }
}

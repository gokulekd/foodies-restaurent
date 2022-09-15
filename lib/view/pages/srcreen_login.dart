import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/controller/email_signin.dart';
import 'package:foodies_restaurent/controller/googlesignin.dart';
import 'package:foodies_restaurent/view/pages/signup_screen.dart';
import 'package:foodies_restaurent/view/widgets/BottomNavigationBarResaurent.dart';
import 'package:foodies_restaurent/view/widgets/TextFormFieldUserCredentials.dart';
import 'package:foodies_restaurent/view/widgets/fireBase_auth_Button.dart';
import 'package:foodies_restaurent/view/widgets/login_signup_button.dart';
import 'package:foodies_restaurent/view/widgets/signup_login_richText.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginScreenBaground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizeH10,
              SizedBox(
                height: 110,
                width: 200,
                child: Image.asset(foodiesLogoImage),
              ),
              Text("Burger",
                  style:
                      GoogleFonts.fredokaOne(fontSize: 40, color: loginColor)),
              sizeH30,
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(loginMainLogo),
                ),
              ),
              TextFormFieldUserCredentials(
                  controller: emailIdController,
                  fieldTitle: "Email id",
                  prefixIconName: iconshop),
              TextFormFieldUserCredentials(
                  controller: passwordController,
                  fieldTitle: "Password",
                  prefixIconName: iconpassword,
                  sufixiconName: iconpasswordvisiblity),
              Consumer<GoogleSignInProvider>(
                builder: (context, value, child) {
                  value.isLoggin
                      ? LoginSignupButton(
                          buttonColor: loginColor,
                          iconText: "Loading...",
                          onPressedFunction: () {
                            log("Loding");
                          })
                      : LoginSignupButton(
                          buttonColor: loginColor,
                          iconText: "Log in",
                          onPressedFunction: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const BottomNavigationBarResaurent(),
                            //   ),
                            // );
                          });
                  return LoginSignupButton(
                    buttonColor: loginColor,
                    iconText: "Log in",
                    onPressedFunction: () async {
                      if (emailIdController.text.trim().isNotEmpty &&
                          passwordController.text.trim().isNotEmpty) {
                        final email = emailIdController.text.trim();
                        final password = passwordController.text.trim();

                        final credentials =
                            await EmailSignin().signInEmail(email, password);
                        if (credentials == "Sucesss") {
                          Get.to(() => const BottomNavigationBarResaurent());
                        } else {
                          Get.snackbar("Alert", credentials);
                        }
                      }
                    },
                  );
                },
              ),
              sizeH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // FirebaseAuthButton(facebookLogo, () {
                  //   print("fb");
                  // }),
                  FirebaseAuthButton(
                      buttonLogo: googleLogo,
                      onPressedFunction: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin(context);

                        Consumer<GoogleSignInProvider>(
                            builder: (context, value, child) {
                          if (value.isLoggin == true) {}
                          return const SizedBox();
                        });
                      }),
                ],
              ),
              sizeH30,
              signupLoginRichText(
                // ignore: unnecessary_string_escapes
                "Don\'t have an account?",
                "signup",
                () async {
                  Get.to(() => ScreenSignup());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

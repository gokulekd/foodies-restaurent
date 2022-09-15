
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/controller/email_signin.dart';
import 'package:foodies_restaurent/view/widgets/BottomNavigationBarResaurent.dart';
import 'package:foodies_restaurent/view/widgets/TextFormFieldUserCredentials.dart';
import 'package:foodies_restaurent/view/widgets/login_signup_button.dart';
import 'package:foodies_restaurent/view/widgets/signup_login_richText.dart';
import 'package:get/get.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 250,
                  // color: Colors.black,
                  child: Image.asset(foodiesLogoImage),
                ),
              ),
              TextFormFieldUserCredentials(
                  controller: nameController,
                  fieldTitle: "Name",
                  prefixIconName: iconuser),
              TextFormFieldUserCredentials(
                  controller: mobileController,
                  fieldTitle: "Mobile",
                  prefixIconName: iconMobile),
              TextFormFieldUserCredentials(
                  controller: emailIdController,
                  fieldTitle: "Email",
                  prefixIconName: iconMail),
              TextFormFieldUserCredentials(
                  controller: passwordController,
                  fieldTitle: "Enter Password",
                  prefixIconName: iconpassword,
                  sufixiconName: iconpasswordvisiblity),
              TextFormFieldUserCredentials(
                  controller: confirmPasswordController,
                  fieldTitle: "confirm Password",
                  prefixIconName: iconpassword,
                  sufixiconName: iconpasswordvisiblity),
              sizeH20,
              LoginSignupButton(
                  onPressedFunction: () async{
                    if (nameController.text.trim().isNotEmpty &&
                        mobileController.text.trim().isNotEmpty &&
                        emailIdController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty &&
                        confirmPasswordController.text.trim().isNotEmpty &&
                        confirmPasswordController.text.trim() ==
                            passwordController.text.trim()) {
                      final email = emailIdController.text.trim();
                      final password = passwordController.text.trim();

                     final credential =  await EmailSignin().signUpEmail(email, password);
                     if (credential == "sucess") {
                      Get.to(()=>const BottomNavigationBarResaurent());
                       
                     }
                     else{
                    Get.snackbar("Alert", credential,backgroundColor: Colors.red,duration: Duration(seconds: 10));
                     }
                    }

                    //     Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>  const BottomNavigationBarResaurent()),
                    // );
                  },
                  buttonColor: signupColor,
                  iconText: "Sign Up"),
              sizeH30,
              sizeH30,
              signupLoginRichText("Allready have an account", "login", () {}),
            ],
          ),
        ),
      ),
    );
  }

  InkWell firebaseAuthButton(
      String buttonLogo, VoidCallback onPressedFunction) {
    return InkWell(
      onTap: onPressedFunction,
      child: Container(
        height: 40,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: circle45, border: Border.all(color: loginColor)),
        child: Image.asset(buttonLogo, fit: BoxFit.contain),
      ),
    );
  }
}

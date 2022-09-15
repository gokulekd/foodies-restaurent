import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';

// firebaseAuthButton(String buttonLogo, VoidCallback onPressedFunction) {
//   return FirebaseAuthButton();
// }

class FirebaseAuthButton extends StatelessWidget {
 final String buttonLogo;
  final VoidCallback onPressedFunction;
  const FirebaseAuthButton({
    Key? key, required this.buttonLogo, required this.onPressedFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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

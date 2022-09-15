import 'package:flutter/material.dart';

class BottomBigButton extends StatelessWidget {
  IconData iconName;
  Color buttonColor;
  String buttonText;
  VoidCallback onPressed;

  BottomBigButton(
      {Key? key,
      required this.iconName,
      required this.buttonColor,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        label: Text(buttonText),
        icon:  Icon(iconName),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          fixedSize: const Size(180, 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed);
  }
}

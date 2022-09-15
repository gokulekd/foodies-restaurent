import 'dart:math';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

// ignore: must_be_immutable
class AnimatedButtonLoading extends StatefulWidget {
  String instialButtonText;
  String failedButtonText;
  String sucsessButtonText;
  AnimatedButtonLoading(
      {Key? key,
      required this.instialButtonText,
      required this.failedButtonText,
      required this.sucsessButtonText})
      : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _AnimatedButtonLoadingState createState() => _AnimatedButtonLoadingState();
}

class _AnimatedButtonLoadingState extends State<AnimatedButtonLoading> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProgressButton.icon(iconedButtons: {
        ButtonState.idle:  IconedButton(
          text: widget.instialButtonText,
          icon: const Icon(Icons.done_outline_outlined, color: Colors.white),
          color: const Color.fromARGB(255, 72, 136, 55),
        ),
        ButtonState.loading:
            IconedButton(text: 'Loading', color: Colors.deepPurple.shade700),
        ButtonState.fail: IconedButton(
            text:widget.failedButtonText,
            icon: const Icon(Icons.cancel, color: Colors.white),
            color: Colors.red.shade300),
        ButtonState.success: IconedButton(
            text: widget.sucsessButtonText,
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            color: Colors.green.shade400)
      }, onPressed: onPressedIconWithText, state: stateTextWithIcon),
    );
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(
              () {
                stateTextWithIcon = Random.secure().nextBool()
                    ? ButtonState.success
                    : ButtonState.fail;
              },
            );
          },
        );

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(
      () {
        stateTextWithIcon = stateTextWithIcon;
      },
    );
  }
}

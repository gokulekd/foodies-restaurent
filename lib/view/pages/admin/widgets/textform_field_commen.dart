import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';

// ignore: must_be_immutable
class TextFormFieldCommen extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String fieldTitle;
  IconData prefixIconName;
  IconData? sufixiconName;

  TextFormFieldCommen({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.fieldTitle,
    required this.prefixIconName,
    this.sufixiconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 60,
        width: 350,
        child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(
                prefixIconName,
                color: textformFieldIconcolor,
              ),
              suffixIcon: Icon(
                sufixiconName,
                color: textformFieldIconcolor,
              ),
              labelText: fieldTitle,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: textformfieldBorder,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: textformfieldBorder,
                  width: 0.5,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/view/dialog/closeRestaurent.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return  AppBar(
          toolbarHeight: 100,
          backgroundColor: kwhite,
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              restaurentUser,
              color: signupColor,
              size: 45,
            ),
          ),
          title: Column(
            children: [
              SizedBox(
                height: 50,
                width: 120,
                child: Image.asset(foodiesLogoImage),
              ),
              Text(
                "Burger",
                style: GoogleFonts.fredokaOne(fontSize: 20, color: loginColor),
              ),
            ],
          ),
          actions: [
            Switch(
              activeColor: loginColor,
              inactiveThumbColor: kblack,
              inactiveTrackColor: kred,
              value: value,
              onChanged: (value) => setState(
                () {
                  closeRestaurent(context);
                  this.value = value;
                },
              ),
            ),
            const Center(
              child: SizedBox(
                height: 20,
                width: 20,
              ),
            ),
          ],
        );
  }
}

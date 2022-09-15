


  import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/images.dart';

import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/pages/firebase_auth.dart';

SizedBox customerDetailsWidgetShowMoreOders(
      double heightMedia, double widthMedia) {
    return SizedBox(
      height: heightMedia * 0.3,
      width: widthMedia * 0.95,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: widthMedia * 0.025,
            child: Container(
              height: heightMedia * 0.25,
              width: widthMedia * 0.95,
              decoration: BoxDecoration(
                borderRadius: circle30,
                color: kwhite,
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: widthMedia * 0.38,
            child: Container(
              decoration: BoxDecoration(borderRadius: circle10),
              height: 80,
              width: 80,
              child: Image.asset(userMale),
            ),
          ),
          Positioned(
            top: 100,
            left: widthMedia * 0.28,
            child: Text(
              "Customer ID : 4590",
              style: googleNormalFont,
            ),
          ),
          Positioned(
            top: 130,
            left: widthMedia * 0.37,
            child: Text(
             firebase.FirebaseAuth.instance.currentUser!.displayName.toString(),
              style: googleNormalFont,
            ),
          ),
          Positioned(
            top: 160,
            left: widthMedia * 0.13,
            child: Text(
              "Gokulofficialchennai@gmail.com",
              style: googleNormalFont,
            ),
          ),
          Positioned(
            top: 190,
            left: widthMedia * 0.31,
            child: Text(
              "+91 9656013606",
              style: googleNormalFont,
            ),
          ),
        ],
      ),
    );
  }





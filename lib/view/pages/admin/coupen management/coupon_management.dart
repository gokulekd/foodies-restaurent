import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/style.dart';

class CoupenManagementPage extends StatelessWidget {
  const CoupenManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          leading: const SizedBox(),
          backgroundColor: kwhite,
          title: Text("Coupen Management Page",style: googleNormalFont,),
          centerTitle: true,
        ),
      body: const Center(child: Text("Coupen Management Page"),),
    );
    
  }
}
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/style.dart';

class OfferManagementPage extends StatelessWidget {
  const OfferManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: kwhite,
          title: Text("Offer Management Page",style: googleNormalFont,),
          centerTitle: true,
        ),
      body: const Center(child: Text("Offer Management Page"),),
    );
  }
}
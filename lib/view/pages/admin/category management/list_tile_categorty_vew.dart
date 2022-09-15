  import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';


Padding listTIleCategory({required String name}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: circle20,
            border: Border.all(color: loginColor, width: 0.5)),
        child: ListTile(
          leading: const Icon(Icons.food_bank,color:signupColor,),
          title:  Text(name),
          trailing: IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.delete,
              color: kred,
            ),
          ),
        ),
      ),
    );
  }

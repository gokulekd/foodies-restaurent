

import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/widgets/veg_or_non_veg_image.dart';

Padding orderItemsListwidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      child: Row(
        children: [
          vegOrNonVegSymbol(nonvegFoodLogo),
          Text(
            "Chiken Burger",
            style: googleNormalFont,
          ),
          const Spacer(),
          Text(
            " 2",
            style: googleNormalFont,
          ),
          sizeW10
        ],
      ),
    ),
  );
}

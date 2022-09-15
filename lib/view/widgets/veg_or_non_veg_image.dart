  import 'package:flutter/material.dart';

Padding vegOrNonVegSymbol(String ImageVegOrNonVeg) {
    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(ImageVegOrNonVeg),),
                );
  }


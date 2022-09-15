import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
  
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Container(
        height: heightMedia*0.06,
        width: widthMedia * 0.95,
        child: TextFormField(
            decoration: InputDecoration(
                fillColor: kblack,
                suffixIcon: Icon(
                  iconSearch,
                  color: textformFieldIconcolor,
                ),
                labelText: "Search",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: textformfieldBorder,
                    width: 0.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: textformfieldBorder,
                    width: 0.5,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20))),
      ),
    );
  }
}

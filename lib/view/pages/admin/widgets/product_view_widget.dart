import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/view/pages/admin/product%20management/product_detailed_view.dart';

class ProductVieTilewWidget extends StatelessWidget {
  const ProductVieTilewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailedViewPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: circle20,
            border: Border.all(
              color: loginColor,
              width: 0.5,
            ),
          ),
          child: ListTile(
              title: const Text("Chicken Cheese burger"),
              leading: SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  child: Image.asset(burger1),
                ),
              ),
              subtitle: const Text("Category : Non Veg  "),
              trailing: (Icon(iconforward))),
        ),
      ),
    );
  }
}

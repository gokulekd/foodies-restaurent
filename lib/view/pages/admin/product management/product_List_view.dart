import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/pages/admin/product%20management/product_image_add.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/product_view_widget.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/search_bar.dart';

class ProductListViewPage extends StatelessWidget {
  const ProductListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          height: 80,
          width: 100,
          child: FloatingActionButton(
              backgroundColor: loginColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const ProductImageAdd(),
                    ));
              },
              child: const Text(
                "Add New Product",
                textAlign: TextAlign.center,
              )),
        ),
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: kwhite,
          title: Text(
            "Product Management Page",
            style: googleNormalFont,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SearchBar(),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) =>
                      const ProductVieTilewWidget(),
                  separatorBuilder: (context, index) => sizeH5,
                  itemCount: 10),
            ),
          ],
        ));
  }
}

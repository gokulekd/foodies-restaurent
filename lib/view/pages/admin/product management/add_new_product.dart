import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/model/add_product_model.dart';
import 'package:foodies_restaurent/view/pages/admin/product%20management/product_List_view.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/drop_down_button.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/textform_field_commen.dart';

import '../../../../controller/add_product_controller.dart';

class AddNewProductPage extends StatelessWidget {
  String path;

  AddNewProductPage({Key? key, required this.path}) : super(key: key);

  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final quantitycontroller = TextEditingController();
  final discrciptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            sizeH10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: path.isEmpty
                    ? Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(uploadNewFood),
                          ),
                          borderRadius: circle20,
                          border: Border.all(color: loginColor, width: 0.5),
                        ),
                        height: 200,
                        width: 250,
                      )
                    : Container(
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(path)),
                        ),
                      ),
              ),
            ),
            TextFormFieldCommen(
                keyboardType: TextInputType.name,
                controller: namecontroller,
                fieldTitle: "Name of Product",
                prefixIconName: productManagemetIcon),
            TextFormFieldCommen(
                keyboardType: TextInputType.number,
                controller: pricecontroller,
                fieldTitle: "price",
                prefixIconName: Icons.attach_money_outlined),
            TextFormFieldCommen(
                keyboardType: TextInputType.number,
                controller: quantitycontroller,
                fieldTitle: "Quantity",
                prefixIconName: Icons.numbers),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: loginColor, width: 0.5),
                    borderRadius: circle20,
                  ),
                  child: const DropDownButton()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 170,
                width: 300,
                child: TextFormField(
                    controller: discrciptioncontroller,
                    maxLines: 7,
                    decoration: InputDecoration(
                      labelText: "Discriptions",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
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
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: () async {
                    User? user = FirebaseAuth.instance.currentUser;
                    final name = namecontroller.text.trim();
                    final price = pricecontroller.text.trim();
                    final quantity = quantitycontroller.text.trim();
                    final discription = discrciptioncontroller.text.trim();
                    if (name.isNotEmpty &&
                        price.isNotEmpty &&
                        quantity.isNotEmpty &&
                        discription.isNotEmpty) {
                      final fullProductData = AddProductModel(
                        image: path.toString(),
                        productName: name,
                        price: int.parse(price),
                        quantity: int.parse(price),
                        category: dropDownValue.toString(),
                        discription: discription,
                        documentID: user!.uid,
                        available: true,
                      );

                      await AddproductFirebase()
                          .addProductController(fullProductData);

                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductListViewPage(),
                          ));
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Product")),
            )
          ],
        ),
      ),
    );
  }
}

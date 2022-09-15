import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/controller/add_category.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/textform_field_commen.dart';
import 'package:get/get.dart';

Dialog addNewCategoryDialogBox(BuildContext context) {
  final dialog = TextEditingController();
  return Dialog(
    backgroundColor: kwhite,
    insetPadding: const EdgeInsets.all(10),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
          child: Column(
            children: [
              Text("Enter New Category Name", style: googleNormalFont),
              sizeH30,
              TextFormFieldCommen(
                  keyboardType: TextInputType.name,
                  controller: dialog,
                  fieldTitle: "Enter Category Name",
                  prefixIconName: Icons.add),
              sizeH40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: kred,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () async {
                        Get.back();
                      },
                      icon: const Icon(Icons.cancel),
                      label: const Text("Cancel")),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: kgreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () async {
                        final categoryname = dialog.text.trim();

                        if (categoryname.isEmpty) {
                          Get.snackbar("Error", "Cateogry field empty",
                              backgroundColor: kred, colorText: kwhite);
                        } else if (categoryname.isNotEmpty) {
                          AddCategory().addNewCategory(categoryname);
                          Get.back();
                         
                        }
                      },
                      icon: const Icon(Icons.add_circle),
                      label: const Text("Add category")),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

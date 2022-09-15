import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:get/get.dart';

class AddCategory {
  final firebase = FirebaseFirestore.instance;
  addNewCategory(String category) async {
    await firebase
        .collection("all Category")
        .add({"category Name": category}).then((value) async {
      Get.snackbar("Message", "New Category added",backgroundColor: kgreen,colorText: kwhite);
      Get.back();
    });
  }
}

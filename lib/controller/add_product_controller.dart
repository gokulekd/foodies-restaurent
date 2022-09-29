import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/model/add_product_model.dart';
import 'package:get/get.dart';

class AddproductFirebase {
  Future addProductController(AddProductModel productModel) async {
    final firebase = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    firebase
        .collection("ProductList")
        .doc(user!.uid)
        .collection(productModel.category!)
        .add(productModel.ProductToJson())
        .then((value) {
      value.update({"id": value.id});
    });
  }

  addProductImage(File filepath) async {
    try {
      final ref = FirebaseStorage.instance
          .ref("Product images/$filepath")
          .child("all Product Image");
      await ref.putFile(filepath).then((p0) async {
        Get.snackbar("message", "Image added Successfully",
            backgroundColor: kgreen, colorText: kwhite);
      });
      final urlDownload = await ref.getDownloadURL();
      return urlDownload;
    } on FirebaseException catch (e) {
      Get.snackbar("Firebase error", e.message.toString(),
          backgroundColor: kred, colorText: kwhite);
    } catch (e) {
      log(e.toString());
    }
  }
}

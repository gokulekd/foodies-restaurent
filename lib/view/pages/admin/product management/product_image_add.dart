import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/controller/add_product_controller.dart';
import 'package:foodies_restaurent/view/pages/admin/product%20management/add_new_product.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductImageAdd extends StatefulWidget {
  const ProductImageAdd({Key? key}) : super(key: key);

  @override
  State<ProductImageAdd> createState() => _ProductImageAddState();
}

class _ProductImageAddState extends State<ProductImageAdd> {
 var task ;
  File? file;
  String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: Text(
          "Select product Image",
          style: googleNormalFont,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            sizeH70,
            Center(
              child: path == null
                  ? Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(uploadNewFood),
                        ),
                        borderRadius: circle20,
                        border: Border.all(color: loginColor, width: 0.5),
                      ),
                      height: 300,
                      width: 300,
                    )
                  : Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: circle20,
                        border: Border.all(color: loginColor),
                        image: DecorationImage(
                            image: FileImage(File(
                              path!,
                            )),
                            fit: BoxFit.cover),
                      ),
                    ),
            ),
            sizeH40,
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: loginColor,
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () async {
                selectFilefromLocal();
                if (path == null) {
                  const ScaffoldMessenger(
                    child: SnackBar(
                      content: Text("No Image Selected"),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.image),
              label: const Text("Select product Image"),
            ),
            sizeH90,
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: kred,
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () async {

                uploadimagetoFirebase();
                // await uploadimagetoFirebase();
                // // ignore: use_build_context_synchronously
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AddNewProductPage(
                //       path: task.toString(),
                //     ),
                //   ),
                // );

                setState(() {});
              },
              icon: const Icon(Icons.forward),
              label: const Text("Proceed to next Page"),
            ),
          ],
        ),
      ),
    );
  }

  Future selectFilefromLocal() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) {
      return;
    }
    path = result.path;
    setState(() => file = File(path!));
  }

  uploadimagetoFirebase() async {


      try {
      final ref = FirebaseStorage.instance.ref("Product images/$file");
      file!.parent;
     await ref.putFile(file!).then((p0) async{
       final urlDownload = await ref.getDownloadURL();
       Get.to(()=>AddNewProductPage(path: urlDownload));

     });
      //   final urlDownload = await ref.getDownloadURL();
      // return urlDownload;
    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
 
    

  }
}

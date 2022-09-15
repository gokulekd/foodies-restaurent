import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/pages/New%20Orders/show_details_new_orders.dart';
import 'package:foodies_restaurent/view/pages/admin/category%20management/add_new_category_dialogBox.dart';
import 'package:foodies_restaurent/view/pages/admin/category%20management/list_tile_categorty_vew.dart';

class CategoryManagementPage extends StatelessWidget {
  const CategoryManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 80,
        width: 100,
        child: FloatingActionButton(
            backgroundColor: loginColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return addNewCategoryDialogBox(context);
                },
              );
            },
            child: const Text(
              "Add New Category",
              textAlign: TextAlign.center,
            )),
      ),
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: kwhite,
        title: Text(
          "Category Management Page",
          style: googleNormalFont,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("all Category").snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                   return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return listTIleCategory(
                  name: snapshot.data!.docs[index]["category Name"]);
            },
          );

                
              }
              else if(snapshot.connectionState == ConnectionState.waiting){
                const SizedBox(child: Center(child: CircularProgressIndicator()));
              }
              return const SizedBox(child: Center(child: Text("No data",)));
       
        },
      )),
    );
  }
}

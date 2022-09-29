import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/model/add_product_model.dart';
import 'package:foodies_restaurent/view/pages/Menu/widget/MenuListWidget.dart';
import 'package:foodies_restaurent/view/pages/drawer/navigation_drawer.dart';
import 'package:foodies_restaurent/view/widgets/custom_appbar.dart';

class ScreenMenu extends StatefulWidget {
  const ScreenMenu({Key? key}) : super(key: key);

  @override
  State<ScreenMenu> createState() => _ScreenMenuState();
}

class _ScreenMenuState extends State<ScreenMenu> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbargoundColor,
      drawer: const NavigationDrawer(),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: CustomAppBar()),
      body: SafeArea(
        child: ListView(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("all Category")
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        //
                        return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("ProductList")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection(
                                  snapshot.data!.docs[index]["category Name"])
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.none) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.data == null) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No Data',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              );
                            }

                            log(snapshot.data!.docs.toString());
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return CartPageFoodDetails(
                                    height: heightMedia,
                                    width: widthMedia,
                                    product: AddProductModel().productFromJson(
                                        snapshot.data!.docs[index]));
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  const SizedBox(
                      child: Center(child: CircularProgressIndicator()));
                }
                return const SizedBox(
                  child: Center(
                    child: Text(
                      "No data",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

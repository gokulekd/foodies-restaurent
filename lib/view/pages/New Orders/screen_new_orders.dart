import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/pages/New%20Orders/show_details_new_orders.dart';

import '../../widgets/show more commen widget/OrderList_widget.dart';

class ScreenNewOrders extends StatefulWidget {
  const ScreenNewOrders({Key? key}) : super(key: key);

  @override
  State<ScreenNewOrders> createState() => _ScreenNewOrdersState();
}

class _ScreenNewOrdersState extends State<ScreenNewOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbargoundColor,
      appBar: AppBar(
        backgroundColor: kwhite,
        centerTitle: true,
        title: Text(
          "New Orders",
          style: googleNormalFont,
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 100),
        itemCount: 10,
        itemBuilder: (context, index) {
          return OrderListWidget(
            visibilityForDeliveryStatus: false,
            buttoncolor: signupColor,
            buttonName: "See Order Details",
            iconName: Icons.new_releases_outlined,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowDetailsNewOders(),
                ),
              );
            },
          );
        },
      )),
    );
  }
}

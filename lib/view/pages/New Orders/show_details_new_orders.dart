import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/dialog/cancelCustomerOrder.dart';
import 'package:foodies_restaurent/view/widgets/deliveryAdressViewWidget.dart';
import 'package:foodies_restaurent/view/widgets/order_billing_splitup_widget.dart';
import '../../widgets/show more commen widget/widgets/BottomBigButton.dart';
import '../../widgets/show more commen widget/widgets/customerDetailsWidgetShowMoreOders.dart';
import '../../widgets/show more commen widget/widgets/orderItemsListwidget.dart';

class ShowDetailsNewOders extends StatelessWidget {
  const ShowDetailsNewOders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: kblack,
            )),
        title: Text(
          "Order id :5465",
          style: googleNormalFont,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 30),
          children: [
            orderItemsListwidget(),
            orderItemsListwidget(),
            orderItemsListwidget(),
            orderBillingSplitup(heightMedia, widthMedia),
            customerDetailsWidgetShowMoreOders(heightMedia, widthMedia),
            deliveryAdressViewWidget(heightMedia, widthMedia, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomBigButton(
                    buttonColor: Colors.red,
                    buttonText: "Cancel",
                    iconName: Icons.cancel,
                    onPressed: () {
                      cancelCustomerOrder(context);
                    }),
                BottomBigButton(
                    buttonColor: const Color.fromARGB(255, 72, 136, 55),
                    buttonText: "Prepare",
                    iconName: Icons.timer_outlined,
                    onPressed: () async {
                      processing(context);
                      circularProgressWaitig(context);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

processing(context) async {
  await Future.delayed(const Duration(seconds: 2));
  Navigator.pop(context);
}

Future<dynamic> circularProgressWaitig(BuildContext context) {
  
  return showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          body: Dialog(
            elevation: 0,
            backgroundColor: transparentColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      backgroundColor: transparentColor,
                    ),
                  ),
                ),
                sizeH40,
                Text(
                  "Please wait",
                  style: TextStyle(color: kwhite),
                )
              ],
            ),
          ),
        );
      });
}
 
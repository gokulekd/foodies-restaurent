import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/widgets/deliveryAdressViewWidget.dart';
import 'package:foodies_restaurent/view/widgets/order_billing_splitup_widget.dart';
import 'package:foodies_restaurent/view/widgets/show%20more%20commen%20widget/widgets/BottomBigButton.dart';
import 'package:foodies_restaurent/view/widgets/show%20more%20commen%20widget/widgets/customerDetailsWidgetShowMoreOders.dart';
import 'package:foodies_restaurent/view/widgets/show%20more%20commen%20widget/widgets/orderItemsListwidget.dart';



class ShowMoreDetailspage extends StatelessWidget {
  const ShowMoreDetailspage({Key? key}) : super(key: key);

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
                BottomBigButton(buttonColor: Colors.red,buttonText: "Cancel",iconName: Icons.cancel,onPressed: (){}),
                     BottomBigButton(buttonColor: const Color.fromARGB(255, 72, 136, 55),buttonText: "Prepare",iconName: Icons.timer_outlined,onPressed: (){}),
               
                
              ],
            ),
          ],
        ),
      ),
    );
  }

}

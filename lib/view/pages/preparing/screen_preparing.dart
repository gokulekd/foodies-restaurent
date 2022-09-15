import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/pages/preparing/show_details_preparing.dart';
import 'package:foodies_restaurent/view/widgets/show%20more%20commen%20widget/OrderList_widget.dart';

class ScreenPreparingPage extends StatelessWidget {
  const ScreenPreparingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kwhite,
          centerTitle: true,
          title: Text(
            "Preparing Orders",
            style: googleNormalFont,
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.only(top: 10, bottom: 100),
          itemCount: 10,
          separatorBuilder: (context, index) => sizeH1,
          itemBuilder: (context, index) {
            return OrderListWidget(
              visibilityForDeliveryStatus: false,
              buttoncolor: loginColor,
              buttonName: "Preparing Details",
              iconName: Icons.av_timer_sharp,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShowDetailsPreparing(),
                    ));
              },
            );
          },
        ));
  }
}

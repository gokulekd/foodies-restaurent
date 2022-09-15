import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';

// ignore: must_be_immutable
class OrderListWidget extends StatelessWidget {
  Color buttoncolor;
  String buttonName;
  IconData iconName;
  VoidCallback onPressed;
  bool visibilityForDeliveryStatus;

  OrderListWidget(
      {Key? key,
      required this.buttoncolor,
      required this.buttonName,
      required this.iconName,
      required this.visibilityForDeliveryStatus,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: heightMedia * 0.17,
        width: widthMedia * 0.12,
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 2, spreadRadius: 0.5)],
            border: Border.all(color: kblack, width: 0.5),
            color: kwhite,
            borderRadius: circle30),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  const Text(
                    "#23234",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: kblack),
                  ),
                  const Spacer(),
                  Container(
                    height: 15,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: circle10,
                        color: const Color.fromARGB(255, 119, 185, 129)),
                    child: const Text(
                      "3.30 PM",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: kwhite),
                    ),
                  ),
                  sizeW10
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: SizedBox(
                width: widthMedia * 0.88,
                child: Row(
                  children:  [
                    const Text(
                      "item count : 2",
                      style: TextStyle(
                          fontSize: 18,
                          color: kblack,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                   Visibility(
                    visible: visibilityForDeliveryStatus,
                     child: Container(
                      height: 17,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: circle10,
                          color: Color.fromARGB(255, 81, 98, 93)),
                      child: const Text(
                        "Deliverd",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                                     ),
                   ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 80,
              child: SizedBox(
                width: 350,
                child: Row(
                  children: [
                    const Text(
                      "12/08/2022",
                      style: TextStyle(
                          fontSize: 18,
                          color: kblack,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: buttoncolor,
                          fixedSize: const Size(300, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        onPressed: onPressed,
                        icon: Icon(iconName),
                        label: Text(buttonName),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

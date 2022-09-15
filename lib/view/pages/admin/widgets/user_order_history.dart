import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';

Padding userOrderHistoryWidget(double heightMedia, double widthMedia) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: heightMedia * 0.28,
      width: widthMedia * 0.95,
      decoration: BoxDecoration(
          borderRadius: circle30,
          color: kwhite,
          border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          sizeH10,
          const Text(
            "Order History",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const Divider(
            thickness: 1,
            color: kblack,
          ),
          sizeH10,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: const [
                Text(
                  "Total orders",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "5",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 58, 132, 60)),
                ),
              ],
            ),
          ),
          sizeH10,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: const [
                Text(
                  "Deliverd orders",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "2",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 58, 132, 60)),
                ),
              ],
            ),
          ),
          sizeH10,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: const [
                Text(
                  "canceled orders",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "4",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 58, 132, 60)),
                ),
              ],
            ),
          ),
          sizeH20,
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: const [
                Text(
                  "total amount payed",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "452",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 58, 132, 60)),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

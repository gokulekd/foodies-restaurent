// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';

// ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  String name;
  String userId;
  bool currentStatus;
  VoidCallback? onPressed;
  ListTileWidget(
      {Key? key,
      required this.userId,
      required this.name,
      this.onPressed,
      required this.currentStatus})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: circle10,
            border: Border.all(color: loginColor, width: 0.5),
            color: kbargoundColor),
        child: ListTile(
          leading: Icon(iconuser),
          title: Text(userId),
          subtitle: Text(name),
          onTap: onPressed,
          trailing: currentStatus
              ? Container(
                  height: 25,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.green, borderRadius: circle10),
                  child: const Center(
                    child: Text(
                      "Active",
                      style: TextStyle(color: kwhite),
                    ),
                  ),
                )
              : Container(
                  height: 25,
                  width: 90,
                  decoration:
                      BoxDecoration(color: kred, borderRadius: circle10),
                  child: const Center(
                    child: Text(
                      "Blocked",
                      style: TextStyle(color: kwhite),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

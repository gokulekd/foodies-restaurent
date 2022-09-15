import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';
import 'package:foodies_restaurent/view/pages/Menu/ScreenMenu.dart';
import 'package:foodies_restaurent/view/pages/New%20Orders/screen_new_orders.dart';
import 'package:foodies_restaurent/view/pages/History/Screen_history.dart';
import 'package:foodies_restaurent/view/pages/preparing/screen_preparing.dart';

// ignore: must_be_immutable
class BottomNavigationBarResaurent extends StatefulWidget {
  const BottomNavigationBarResaurent({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarResaurent> createState() =>
      _BottomNavigationBarResaurentState();
}

class _BottomNavigationBarResaurentState
    extends State<BottomNavigationBarResaurent> {
  int pageIndex = 0;

  final List<Widget> _pages = [
    const ScreenMenu(),
    const ScreenNewOrders(),
    const ScreenPreparingPage(),
    const ScreenHistoryPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: kwhite, // <-- This works for fixed
          selectedItemColor: const Color.fromARGB(255, 57, 162, 111),
          unselectedItemColor: Colors.grey,
          onTap: (int value) {
            setState(() {
              pageIndex = value;
            });
          },
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(label: "Menu", icon: Icon(iconmenu)),
            BottomNavigationBarItem(
                label: "New Order", icon: Icon(iconNewOrders)),
            BottomNavigationBarItem(
                label: "Preparing", icon: Icon(iconPreparing)),
            BottomNavigationBarItem(label: "History", icon: Icon(iconHistory)),
          ]),
    );
  }
}

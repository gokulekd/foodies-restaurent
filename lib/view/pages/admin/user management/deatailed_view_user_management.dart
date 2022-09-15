import 'package:flutter/material.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/user_order_history.dart';
import 'package:foodies_restaurent/view/widgets/deliveryAdressViewWidget.dart';
import 'package:foodies_restaurent/view/widgets/show%20more%20commen%20widget/widgets/customerDetailsWidgetShowMoreOders.dart';

// ignore: must_be_immutable
class UserManagementDetailedView extends StatefulWidget {
  const UserManagementDetailedView({Key? key}) : super(key: key);

  @override
  State<UserManagementDetailedView> createState() =>
      _UserManagementDetailedViewState();
}

class _UserManagementDetailedViewState
    extends State<UserManagementDetailedView> {
  bool userBlocked = true;

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            customerDetailsWidgetShowMoreOders(heightMedia, widthMedia),
            deliveryAdressViewWidget(heightMedia, widthMedia, context),
            userOrderHistoryWidget(heightMedia, widthMedia),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => setState(() => userBlocked = !userBlocked),
                style: ElevatedButton.styleFrom(
                  primary: userBlocked
                      ? Colors.red
                      : Colors.green, // This is what you need!
                ),
                child: Text(userBlocked ? 'Unblock User' : 'Block User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

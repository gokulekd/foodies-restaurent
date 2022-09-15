import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/pages/admin/user%20management/deatailed_view_user_management.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/list_tile.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/search_bar.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: kwhite,
          title: Text(
            "User Management Page",
            style: googleNormalFont,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
        const SearchBar(),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) => ListTileWidget(
                      userId: "78945",
                      name: "Rahul v s",
                      currentStatus: false,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                 UserManagementDetailedView(),
                          ),
                        );
                      }),
                  separatorBuilder: (context, index) => sizeH5,
                  itemCount: 10),
            ),
          ],
        ));
  }
}


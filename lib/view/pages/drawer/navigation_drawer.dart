
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/view/pages/drawer/adminpanel.dart';
import 'package:foodies_restaurent/view/pages/drawer/feebbackPage.dart';
import 'package:foodies_restaurent/view/pages/drawer/privacy_and_policy.dart';
import 'package:foodies_restaurent/view/pages/drawer/terms_and_conditions.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 240, 247, 244),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: 250,
            child: Image.asset(foodiesLogoImage),
            // color: kred,
          ),
          Text("Burger",
              style: GoogleFonts.fredokaOne(fontSize: 40, color: loginColor)),
          sizeH20,
          buiditemlist(
              iconname: adminIcon,
              name: "admin",
              onPressed: () => selectedIndexPage(context, 1)),
          buiditemlist(iconname: privacyIcon, name: "Privacy and policy",onPressed: () => selectedIndexPage(context, 2)),
          buiditemlist(
              iconname: termsANdConditionsicon, name: "Terms and Conditions",onPressed: () => selectedIndexPage(context, 3)),
          buiditemlist(iconname: shareAppicon, name: "Share the app",onPressed: () {}),
          buiditemlist(iconname: abouticon, name: "about",onPressed: () {}),
          buiditemlist(iconname: feedbackicon, name: "Feed Back",onPressed: () => selectedIndexPage(context, 6)),
        ],
      ),
    );
  }
}

buiditemlist(
    {required String name,
    required IconData iconname,
    VoidCallback? onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: circle10, border: Border.all(color: loginColor)),
      child: ListTile(
        leading: Icon(
          iconname,
          color: signupColor,
        ),
        title: Text(
          name,
          style: const TextStyle(color: loginColor),
        ),
        onTap: onPressed,
      ),
    ),
  );
}

selectedIndexPage(BuildContext context, int index) {
  switch (index) {
    case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const AdminPanel()));
      break;
    case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const PrivacyAndPolicy()));
      break;
    case 3:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const TermsAndConditions()));
      break;
      //  case 4:
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (_) => const TermsAndConditions()));
      // break;
      //  case 5:
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (_) => const TermsAndConditions()));
      // break;
    case 6:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const FeedBackPage()));
      break;
  }
}

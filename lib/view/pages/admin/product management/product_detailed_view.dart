import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:foodies_restaurent/view/dialog/cancelCustomerOrder.dart';
import 'package:foodies_restaurent/view/pages/admin/product%20management/product_update_page.dart';
import 'package:foodies_restaurent/view/widgets/show%20more%20commen%20widget/widgets/BottomBigButton.dart';

class ProductDetailedViewPage extends StatelessWidget {
  const ProductDetailedViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: googleNormalFont,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: circle20),
              height: heightMedia * 0.25,
              width: widthMedia * 0.25,
              child: ClipRect(
                child: Image.asset(burger1),
              ),
            ),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Cheese Chiken Burger",
                      style: googleNormalFont,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Non Veg",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "198",
                      style: TextStyle(
                        color: kgreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  sizeH10,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Discripton",
                      style: normalfont15,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "If you are fond of cheesy indulgence, then this drool-worthy burger is for you! This oozing out cheeseburger will allure you to grab a bite and indulge in the goodness of the tasty meaty burger. Burgers are one of the easiest on-the-go delicacies in the world. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightMedia * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomBigButton(
                    buttonColor: Colors.red,
                    buttonText: "Delete Product",
                    iconName: Icons.cancel,
                    onPressed: () {
                      cancelCustomerOrder(context);
                    }),
                BottomBigButton(
                    buttonColor: const Color.fromARGB(255, 72, 136, 55),
                    buttonText: "Edit Product ",
                    iconName: Icons.edit,
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  ProductUpdatePage(),
                          ));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

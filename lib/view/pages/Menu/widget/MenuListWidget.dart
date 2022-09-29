import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import '../../../../model/add_product_model.dart';

// ignore: must_be_immutable
class CartPageFoodDetails extends StatefulWidget {
  final double height;
  AddProductModel product;

  final double width;

  CartPageFoodDetails(
      {Key? key,
      required this.height,
      required this.width,
      required this.product})
      : super(key: key);

  @override
  State<CartPageFoodDetails> createState() => _CartPageFoodDetailsState();
}

class _CartPageFoodDetailsState extends State<CartPageFoodDetails> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(blurRadius: 2, spreadRadius: 0.5)],
              border: Border.all(color: kblack, width: 0.5),
              color: kwhite,
              borderRadius: circle20),
          height: widget.height * 0.15,
          width: widget.width * 0.95,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.product.image!),
                            fit: BoxFit.cover),
                        borderRadius: circle20),
                    height: widget.height * 0.12,
                    width: widget.width * 0.25,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 140,
                child: Text(
                  widget.product.productName!.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 45,
                left: 140,
                child: Text(
                  "Category : ${widget.product.category!.toString()}",
                  style: const TextStyle(fontSize: 18, color: kblack),
                ),
              ),
              Positioned(
                top: 70,
                left: 140,
                child: Text(
                  "₹ ${widget.product.price!.toString()}",
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 66, 149, 69)),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 220,
                child: SizedBox(
                  width: widthMedia * 0.36,
                  child: Row(
                    children: [
                      const Spacer(),
                      Switch(
                        activeColor: loginColor,
                        inactiveThumbColor: kblack,
                        inactiveTrackColor: kred,
                        value: value,
                        onChanged: (value) => setState(
                          () {
                            this.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

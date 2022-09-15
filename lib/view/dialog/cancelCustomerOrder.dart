import 'package:flutter/material.dart';

Future<dynamic> cancelCustomerOrder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert"),
        content: const Text(
          "Are You Sure to Cancel this Customer Order ?\n \n If it is nessesery to cancel the order please inform the customer ",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 115, 182, 211),
                fixedSize: const Size(130, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text("Call Customer"),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const CheckOutPage(),
              //     ));
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 206, 79, 77),
                fixedSize: const Size(130, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text("Cancel Anyway"),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const CheckOutPage(),
              //     ));
            },
          ),
        ],
      );
    },
  );
}

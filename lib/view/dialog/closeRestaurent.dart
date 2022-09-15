import 'package:flutter/material.dart';

Future<dynamic> closeRestaurent(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert"),
        content: const Text(
          "Are You Sure to Clode the Restaurent ? ",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 115, 182, 211),
                fixedSize: const Size(130, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text("Yes"),
            onPressed: () {
                  Navigator.pop(context);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 206, 79, 77),
                fixedSize: const Size(130, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text("No"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

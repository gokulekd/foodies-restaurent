import 'package:cloud_firestore/cloud_firestore.dart';

class UseremailModel {
  String name;
  String mobile;
  String email;
  String password;

  UseremailModel(
      {required this.name,
      required this.mobile,
      required this.email,
      required this.password});

  Map<String, dynamic> emailtoJson() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        "password": password,
      };

  productFromJson(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
   
    return UseremailModel(
      name: snapshot["name"],
      mobile: snapshot["mobile"],
      email: snapshot["email"],
      password: snapshot["password"],
    );
  }
}

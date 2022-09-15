import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/border_radious.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/icons.dart';
import 'package:foodies_restaurent/constants/images.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/drop_down_button.dart';
import 'package:foodies_restaurent/view/pages/admin/widgets/textform_field_commen.dart';
import 'package:foodies_restaurent/view/widgets/animated_button_loading.dart';

class ProductUpdatePage extends StatelessWidget {
   ProductUpdatePage({Key? key}) : super(key: key);
final nameUpdate  = TextEditingController();
final priceupdate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        children: [
          sizeH10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: circle20,
                  border: Border.all(color: loginColor,width: 0.5)
                ),
                height: 200,
                width: 250,
                child: ClipRRect(
                    borderRadius: circle20,
                  child: Image.asset(uploadNewFood,fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
          TextFormFieldCommen(
            keyboardType: TextInputType.name,
            controller: nameUpdate,
              fieldTitle: "Name of Product",
              prefixIconName: productManagemetIcon),
          TextFormFieldCommen(
                  keyboardType: TextInputType.number,
            controller: priceupdate,
              fieldTitle: "price", prefixIconName: Icons.attach_money_outlined),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: loginColor, width: 0.5),
                  borderRadius: circle20,
                ),
                child: const DropDownButton()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 170,
              width: 300,
              child: TextFormField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    labelText: "Discriptions",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: textformfieldBorder,
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: textformfieldBorder,
                        width: 0.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                  )),
            ),
          ),
  AnimatedButtonLoading(instialButtonText: "Update",failedButtonText: "try Again",sucsessButtonText: "Sucsess",)
        ],
      ),
      ),
    );
  }
}


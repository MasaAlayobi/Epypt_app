// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';



class myTextFieldName extends StatelessWidget {
  final String? validatorText;
  String nameText;
  final bool? ReadeOnly;
  myTextFieldName({
    Key? key,
    this.validatorText,
    required this.nameText,
    required this.nameController,this.ReadeOnly,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: ReadeOnly??false,
      keyboardType: TextInputType.name,
      cursorColor: ColorManager().red,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: ColorManager().red),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red),
            borderRadius: BorderRadius.circular(12)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red),
            borderRadius: BorderRadius.circular(12)),
        fillColor: Colors.grey[200],
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red),
            borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red)),
        hintText: nameText,
        labelStyle: TextStyle(fontSize: 77, color: ColorManager().red),
      ),
      validator: (text) {
        if (text!.isEmpty) {
          return validatorText;
        }
      },
      controller: nameController,
    );
  }
}

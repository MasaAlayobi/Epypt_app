
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class myTextFieldName extends StatelessWidget {
  final String? validatorText;
  String nameText;
  final bool readOnly;
  final String? label;
  myTextFieldName({
    super.key,
    this.validatorText,
    required this.nameText,
    required this.nameController,
    required this.readOnly,
    this.label,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
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
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(fontSize: 16, color: ColorManager().red),
      ),
      validator: (text) {
        if (text!.isEmpty) {
          return validatorText;
        }
        return null;
      },
      controller: nameController,
    );
  }
}

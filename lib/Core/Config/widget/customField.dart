import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class CustomTextfield extends StatelessWidget {
  final String? hint;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final Text? label;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final int? maxLength;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool? isDense;
  final String? labelText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? suffix;

  const CustomTextfield({
    super.key,
    this.hint,
    this.onChanged,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText = false,
    this.label,
    this.hintStyle,
    this.controller,
    this.maxLength,
    this.labelStyle,
    this.floatingLabelStyle,
    this.maxLines = 1,
    this.validator,
    this.readOnly = false,
    this.isDense,
    this.labelText,
    this.floatingLabelBehavior,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

    // Calculate padding dynamically based on screen width
    final double horizontalPadding =
        screenSize.width * 0.08; // 8% of screen width

    // Adjust text size based on screen size (you can fine-tune this as needed)
    final double textSize =
        screenSize.width < 600 ? 14 : 16; // Smaller text for smaller screens
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: TextFormField(
        readOnly: readOnly,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
            floatingLabelBehavior: floatingLabelBehavior,
            errorStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            isDense: isDense,
            suffixIcon: suffixIcon,
            label: label,
            floatingLabelStyle: floatingLabelStyle,
            labelStyle: labelStyle,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: hintStyle?.copyWith(fontSize: textSize) ??
                TextStyle(fontSize: textSize),
            fillColor:Colors.grey[200],
            filled: true,
            enabledBorder: buildBorder(),
            border: buildBorder(),
            focusedBorder: buildBorder(colorApp.basicColor),
            suffix: suffix),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:
          BorderSide(color: color ??  colorApp.basicColor),
    );
  }
}

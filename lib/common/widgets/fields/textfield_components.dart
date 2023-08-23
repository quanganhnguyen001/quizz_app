import 'package:flutter/material.dart';
import 'package:od/theme/color_palettes.dart';

class TextFieldComponents extends StatelessWidget {
  const TextFieldComponents(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.backgroundColor,
      this.borderColor,
      this.padding,
      this.hinText,
      this.hintStyle,
      this.suffixIcon,
      this.controller,
      this.onChanged,
      this.obscureText,
      this.keyboardType,
      this.rightIcon,
      this.validator,
      this.onSaved});
  final double? width;
  final double? height;
  final double? radius;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final String? hinText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: ColorPalettes.grayColor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: ColorPalettes.grayColor,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: ColorPalettes.grayColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: ColorPalettes.grayColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: ColorPalettes.grayColor,
            )),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintText: hinText,
        hintStyle: hintStyle,
        suffixIcon: rightIcon,
      ),
    );
  }
}

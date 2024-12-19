import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/constant/colors.dart';

class CustomTextFormFaild extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  const CustomTextFormFaild(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: validator,
      maxLines: 1,
      cursorColor: AppColors.primaryColorGreen,
      controller: textEditingController,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "ArbFONTS-Almarai-Bold",
          ),
          fillColor: AppColors.secoundColorOne.withOpacity(0.7),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';

import '../../../../../../core/constant/colors.dart';

class CustomTextFormFaildDialog extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final DeviceInfo? deviceInfo;
  const CustomTextFormFaildDialog(
      {super.key,
      required this.label,
      required this.textEditingController,
      required this.validator,
      this.obscureText,
      this.deviceInfo});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.only(top: deviceInfo!.localHeight! / 27),
        // padding: const EdgeInsets.symmetric(vertical: 3),
        child: TextFormField(
          obscureText: obscureText ?? false,
          validator: validator,
          maxLines: 1,
          cursorColor: AppColors.primaryColorGreen,
          controller: textEditingController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: deviceInfo!.localHeight! / 34, horizontal: 10),
              filled: true,
              label: Container(
                  margin:
                      EdgeInsets.only(bottom: deviceInfo!.localHeight! / 25),
                  child: Text(
                    label,
                    style: TextStyle(fontSize: deviceInfo!.localHeight! / 34),
                  )),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              alignLabelWithHint: true,
              fillColor: AppColors.secoundColorOne.withOpacity(0.7),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}

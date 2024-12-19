import 'package:flutter/material.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/models/device_info.dart';

class CustomDialogButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isCancel;
  final DeviceInfo deviceInfo;
  const CustomDialogButton(
      {super.key,
      required this.text,
      this.isCancel = false,
      required this.deviceInfo,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: isCancel
          ? AppColors.greyShadeTwo
          : AppColors.primaryColorGreenAcssent,
      height: deviceInfo.localHeight! / 20,
      minWidth: 100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: isCancel
              ? const BorderSide(color: AppColors.primaryColorGreenAcssent)
              : BorderSide.none),
      textColor: isCancel ? AppColors.textColorBlack : AppColors.textColorWhite,
      child: Text(text),
    );
  }
}

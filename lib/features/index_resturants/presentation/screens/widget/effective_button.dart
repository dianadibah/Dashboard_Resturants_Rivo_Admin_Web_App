import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/constant/colors.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';

import '../../../../../core/widgets/text_title.dart';

class EffectiveButton extends StatelessWidget {
  final DeviceInfo deviceInfo;
  final bool isPressed;
  final String title;
  final void Function()? effectiveFun;
  const EffectiveButton(
      {super.key,
      required this.deviceInfo,
      required this.isPressed,
      required this.title,
      required this.effectiveFun});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isPressed ? AppColors.secoundColorOne : null,
      minWidth: deviceInfo.localWidth! / 10,
      height: deviceInfo.localHeight! / 22,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: effectiveFun,
      child: TextTitle(
        title: title,
        fontSize: deviceInfo.localHeight! / 34,
        color: AppColors.textColorBlack,
      ),
    );
  }
}

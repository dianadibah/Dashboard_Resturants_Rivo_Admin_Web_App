import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/constant/colors.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';

import 'alert_dialog.dart';

class CustomDialog extends StatefulWidget {
  final DeviceInfo deviceInfo;
  const CustomDialog({super.key, required this.deviceInfo});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final pageController = PageController(
    initialPage: 0,
  );
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: widget.deviceInfo.localHeight! / 0.9,
      width: widget.deviceInfo.localHeight! / 8,
      child: MaterialButton(
        padding: const EdgeInsets.all(2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppColors.primaryColorGreenAcssent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialogShow(
                  deviceInfo: widget.deviceInfo,
                  pageController: pageController,
                  currentPage: currentPage,
                  onPageChanged: (value) {
                    currentPage = value;
                  },
                );
              });
        },
        child: Text(
          "+إضافة مطعم",
          style: TextStyle(
              color: AppColors.textColorWhite,
              fontSize: widget.deviceInfo.localHeight! / 55,
              height: 0.0),
        ),
      ),
    ));
  }
}

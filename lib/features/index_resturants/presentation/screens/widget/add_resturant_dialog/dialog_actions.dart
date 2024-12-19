import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/constant/colors.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/add_resturant_dialog/dialog_button.dart';

class CustomDialogActions extends StatefulWidget {
  final DeviceInfo deviceInfo;
  final void Function() onPressedCancel;
  final void Function() onPressedNext;
  final String pageNumberText;
  final String textBotton;
  const CustomDialogActions(
      {super.key,
      required this.deviceInfo,
      required this.onPressedCancel,
      required this.onPressedNext,
      required this.pageNumberText, required this.textBotton});

  @override
  State<CustomDialogActions> createState() => _CustomDialodActionsState();
}

class _CustomDialodActionsState extends State<CustomDialogActions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.pageNumberText,
              style: const TextStyle(
                  fontSize: 20, color: AppColors.primaryColorGreenAcssent),
            ),
            const Text(
              "/2",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomDialogButton(
                text: widget.textBotton,
                deviceInfo: widget.deviceInfo,
                onPressed: widget.onPressedNext),
            const SizedBox(
              width: 10,
            ),
            CustomDialogButton(
              text: "إلغاء",
              deviceInfo: widget.deviceInfo,
              isCancel: true,
              onPressed: widget.onPressedCancel,
            )
          ],
        )
      ],
    );
  }
}

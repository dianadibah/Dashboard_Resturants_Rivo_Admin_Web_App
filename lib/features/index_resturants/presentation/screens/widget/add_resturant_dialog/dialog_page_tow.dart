import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';

import 'dropdown_menu.dart';
import 'text_form_faild_dialog.dart';

class CustomDialogPageTow extends StatefulWidget {
  final DeviceInfo deviceInfo;
  const CustomDialogPageTow({super.key, required this.deviceInfo});

  @override
  State<CustomDialogPageTow> createState() => _CustomDialogPageTowState();
}

class _CustomDialogPageTowState extends State<CustomDialogPageTow> {
  late TextEditingController faceBookLinkController;
  late TextEditingController firstPrizeController;
  late TextEditingController instagarmLinkController;
  late TextEditingController discountRateController;
  late String typeMenu;
  @override
  void initState() {
    faceBookLinkController = TextEditingController();
    firstPrizeController = TextEditingController();
    instagarmLinkController = TextEditingController();
    discountRateController = TextEditingController();
    typeMenu = "النموذج الأول";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.deviceInfo.localHeight! / 0.5,
      width: widget.deviceInfo.localWidth! / 1.6,
      child: Column(
        children: [
          CustomTextFormFaildDialog(
            label: "رابط الفيسبوك",
            textEditingController: faceBookLinkController,
            validator: (val) {
              return null;
            },
          ),
          CustomTextFormFaildDialog(
            label: "رابط الانستغرام",
            textEditingController: instagarmLinkController,
            validator: (val) {
              return null;
            },
          ),
          CustomTypeMenu(
            onChanged: (val) {},
            typeMenu: typeMenu,
          ),
          CustomTextFormFaildDialog(
            label: "الجائزة الأولى",
            textEditingController: firstPrizeController,
            validator: (val) {
              return null;
            },
          ),
          CustomTextFormFaildDialog(
            label: "نسبة الحسم",
            textEditingController: discountRateController,
            validator: (val) {
              return null;
            },
          ),
        ],
      ),
    );
  }
}

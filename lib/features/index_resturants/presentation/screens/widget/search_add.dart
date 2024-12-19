import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/constant/colors.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';

import '../../../../../core/widgets/text_form_faild copy.dart';
import 'add_resturant_dialog/dialog.dart';

class SearchAdd extends StatelessWidget {
  final void Function()? serachFun;
  final void Function()? addResturant;
  final TextEditingController searchController;
  final DeviceInfo deviceInfo;

  const SearchAdd(
      {super.key,
      required this.serachFun,
      required this.searchController,
      required this.deviceInfo,
      this.addResturant});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceInfo.localHeight! / 18,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: deviceInfo.localHeight! / 19,
            width: deviceInfo.localWidth! / 3,
            child: CustomTextFormFaild(
                hintText: "البحث", textEditingController: searchController),
          ),
          const SizedBox(width: 10),
          MaterialButton(
            color: AppColors.primaryColorGreen,
            height: deviceInfo.localHeight! / 14,
            minWidth: deviceInfo.localWidth! / 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: serachFun,
            child: Icon(
              Icons.search,
              color: AppColors.greyShadeTwo,
              size: deviceInfo.localHeight! / 35,
            ),
          ),
          const SizedBox(width: 10),
          CustomDialog(
            deviceInfo: deviceInfo,
          )
        ],
      ),
    );
  }
}

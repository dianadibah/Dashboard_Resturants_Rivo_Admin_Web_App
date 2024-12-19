import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';

import 'text_form_faild_dialog.dart';

class CustomDialogPageOne extends StatefulWidget {
  final DeviceInfo deviceInfo;
  const CustomDialogPageOne({super.key, required this.deviceInfo});

  @override
  State<CustomDialogPageOne> createState() => _CustomDialogPageOneState();
}

class _CustomDialogPageOneState extends State<CustomDialogPageOne> {
  late TextEditingController userNameController;
  late TextEditingController resturantNameController;
  late TextEditingController passwordController;
  late TextEditingController repasswordController;
  late TextEditingController supscriptionTimeController;
  late TextEditingController cityController;
  late TextEditingController addressController;
  @override
  void initState() {
    // TODO: implement initState
    userNameController = TextEditingController();
    resturantNameController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    supscriptionTimeController = TextEditingController();
    cityController = TextEditingController();
    addressController = TextEditingController();

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
            label: "اسم المستخدم",
            textEditingController: userNameController,
            validator: (val) {
              return null;
            },
          ),
          CustomTextFormFaildDialog(
            label: "اسم المطعم",
            textEditingController: resturantNameController,
            validator: (val) {
              return null;
            },
          ),
          CustomTextFormFaildDialog(
            label: "كلمة المرور",
            textEditingController: passwordController,
            validator: (val) {
              return null;
            },
          ),
          CustomTextFormFaildDialog(
            label: "تأكيد كلمة المرور",
            textEditingController: repasswordController,
            validator: (val) {
              return null;
            },
          ),
          CustomTextFormFaildDialog(
            label: "مدة الاشتراك",
            textEditingController: supscriptionTimeController,
            validator: (val) {
              return null;
            },
          ),
          CustomTextFormFaildDialog(
            label: "المدينة",
            textEditingController: cityController,
            validator: (val) {
              return null;
            },
          ),
          CustomTextFormFaildDialog(
            label: "العنوان",
            textEditingController: addressController,
            validator: (val) {
              return null;
            },
          ),
        ],
      ),
    );
  }
}

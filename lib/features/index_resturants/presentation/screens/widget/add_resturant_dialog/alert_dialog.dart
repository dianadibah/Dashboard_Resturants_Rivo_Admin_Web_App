import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rivo_admin_app/core/constant/toast.dart';
import 'package:rivo_admin_app/core/enum/device_type.dart';
import 'package:rivo_admin_app/core/functions/validat.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';
import 'package:rivo_admin_app/features/resturant_create_update/presntation/bloc/resturant_create_update_bloc.dart';
import 'package:path/path.dart' as p;
import '../../../../../../core/constant/colors.dart';
import '../../../../../resturant_create_update/domain/usecases/create_resturant_usecase.dart';
import 'dialog_actions.dart';
import 'dialog_color_picker.dart';
import 'dialog_drop_down_city.dart';
import 'dropdown_menu.dart';
import 'text_form_faild_dialog.dart';

class CustomAlertDialogShow extends StatefulWidget {
  final DeviceInfo deviceInfo;
  final int currentPage;
  final PageController pageController;
  final void Function(int)? onPageChanged;
  const CustomAlertDialogShow(
      {super.key,
      required this.deviceInfo,
      required this.currentPage,
      required this.pageController,
      this.onPageChanged});

  @override
  State<CustomAlertDialogShow> createState() => _CustomAlertDialogShowState();
}

class _CustomAlertDialogShowState extends State<CustomAlertDialogShow> {
  late TextEditingController userNameController;
  late TextEditingController resturantNameController;
  late TextEditingController passwordController;
  late TextEditingController repasswordController;
  late TextEditingController supscriptionTimeController;
  late TextEditingController cityController;
  late TextEditingController phoneController;
  late TextEditingController faceBookLinkController;
  late TextEditingController firstAwardController;
  late TextEditingController instagarmLinkController;
  late TextEditingController discountRateController;
  String? userNameText;
  String? resturantNameText;
  String? passwordText;
  String? repasswordText;
  String? supscriptionTimeText;
  String? cityText;
  String? addressText;
  String? faceBookLinkText;
  String? firstAwardText;
  String? instagarmLinkText;
  String? discountRateText;
  late String typeMenu;
  late ImagePicker picker;
  int currentPage = 0;
  late String city;
  late String color;
  File? fileLogo;
  File? fileMainImage;
  File? fileBackgroundImage;
  XFile? xfileLogo = XFile("");
  XFile? xfileMainImage = XFile("");
  XFile? xfileBackgroundImage = XFile("");
  late ResturantCreateUpdateBloc bloc;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  List<int>? _selectedFile;
  Uint8List? _bytesData;

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        setState(() {
          _bytesData =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          _selectedFile = _bytesData;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  @override
  void initState() {
    picker = ImagePicker();
    color = "0000000";
    bloc = ResturantCreateUpdateBloc();
    userNameController = TextEditingController();
    resturantNameController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    supscriptionTimeController = TextEditingController();
    cityController = TextEditingController();
    phoneController = TextEditingController();
    faceBookLinkController = TextEditingController();
    firstAwardController = TextEditingController();
    instagarmLinkController = TextEditingController();
    discountRateController = TextEditingController();
    typeMenu = "1";
    city = "حلب";
    widget.pageController.addListener(() {
      setState(() {
        currentPage = widget.pageController.page!.toInt();
      });
    });
    super.initState();
  }

  Future<File> getImageFromGallray(XFile? file) async {
    file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      var image;
      setState(() {
        image = File(file!.path);
      });

      log(p.basename(file.path));
      return image;
    } else {
      Toast.showText(text: "Please Choose a picture");
      return File("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Form(
        key: _formState,
        child:
            BlocBuilder<ResturantCreateUpdateBloc, ResturantCreateUpdateState>(
          builder: (context, state) {
            return AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              actionsOverflowAlignment: OverflowBarAlignment.center,
              actions: [
                CustomDialogActions(
                  textBotton: currentPage == 0 ? "التالي" : "إضافة",
                  pageNumberText: "${currentPage + 1}",
                  deviceInfo: widget.deviceInfo,
                  onPressedCancel: () {
                    Navigator.of(context).pop();
                  },
                  onPressedNext: () {
                    if (currentPage + 1 == 1) {
                      if (_formState.currentState!.validate()) {
                        widget.pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeInOut);
                      }
                    } else {
                      if (_formState.currentState!.validate()) {
                        bloc.add(CreateResturantEvent(
                            createResturantsParams: CreateResturantsParams(
                                name: userNameController.text,
                                firstAward: firstAwardController.text,
                                color:
                                    "#${state.currentColor.value.toString()}",
                                logo: p.basename(fileLogo!.path),
                                background:
                                    p.basename(fileBackgroundImage!.path),
                                username: userNameController.text,
                                password: passwordController.text,
                                passwordConfirmation: repasswordController.text,
                                phone: phoneController.text,
                                address: city,
                                facebookUrl: faceBookLinkController.text,
                                instagramUrl: instagarmLinkController.text,
                                banner: p.basename(fileMainImage!.path),
                                discountPercent: discountRateController.text,
                                templeteId: typeMenu,
                                durationMonths:
                                    supscriptionTimeController.text)));
                      }
                    }
                  },
                )
              ],
              backgroundColor: Colors.white,
              shadowColor: AppColors.greyShadeOne,
              title: const Text(
                "إضافة مطعم",
                textAlign: TextAlign.center,
              ),
              titleTextStyle: const TextStyle(
                  fontSize: 25, color: AppColors.textColorBlack),
              alignment: Alignment.center,
              content: SizedBox(
                height: widget.deviceInfo.localHeight! / 2,
                width: 600,
                child: widget.deviceInfo.deviceType == DeviceType.Mobile
                    ? PageView(
                        reverse: true,
                        physics: const ScrollPhysics(),
                        onPageChanged: widget.onPageChanged,
                        scrollDirection: Axis.horizontal,
                        controller: widget.pageController,
                        children: [
                            SizedBox(
                              width: widget.deviceInfo.localWidth! / 1.6,
                              height: widget.deviceInfo.localHeight! / 1.6,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      CustomTextFormFaildDialog(
                                        deviceInfo: widget.deviceInfo,
                                        label: "اسم المستخدم",
                                        textEditingController:
                                            userNameController,
                                        validator: (val) {
                                          return validator(
                                              val!, 3, 30, "user name");
                                        },
                                      ),
                                      CustomTextFormFaildDialog(
                                        deviceInfo: widget.deviceInfo,
                                        label: "اسم المطعم",
                                        textEditingController:
                                            resturantNameController,
                                        validator: (val) {
                                          return validator(
                                              val!, 3, 20, "resturant name");
                                        },
                                      ),
                                      CustomTextFormFaildDialog(
                                        deviceInfo: widget.deviceInfo,
                                        label: "كلمة المرور",
                                        textEditingController:
                                            passwordController,
                                        validator: (val) {
                                          return validator(
                                              val!, 8, 30, "password");
                                        },
                                      ),
                                      CustomTextFormFaildDialog(
                                        deviceInfo: widget.deviceInfo,
                                        label: "تأكيد كلمة المرور",
                                        textEditingController:
                                            repasswordController,
                                        validator: (val) {
                                          return validator(
                                              val!, 8, 30, "confirm password");
                                        },
                                      ),
                                      CustomTextFormFaildDialog(
                                        deviceInfo: widget.deviceInfo,
                                        label: "مدة الاشتراك",
                                        textEditingController:
                                            supscriptionTimeController,
                                        validator: (val) {
                                          return validator(
                                              val!, 1, 5, "month duration");
                                        },
                                      ),
                                      CustomTextFormFaildDialog(
                                        deviceInfo: widget.deviceInfo,
                                        label: "رقم الهاتف ",
                                        textEditingController: phoneController,
                                        validator: (val) {
                                          return validator(
                                              val!, 10, 30, "phone");
                                        },
                                      ),
                                      CustomDropDownCities(
                                        typeCity: city,
                                        onChanged: (val) {
                                          city = val!;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: widget.deviceInfo.localHeight! / 1.6,
                              width: widget.deviceInfo.localWidth! / 3,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "رابط الفيسبوك",
                                      textEditingController:
                                          faceBookLinkController,
                                      validator: (val) {
                                        return validator(
                                            val!, 10, 40, "facebook url");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "رابط الانستغرام",
                                      textEditingController:
                                          instagarmLinkController,
                                      validator: (val) {
                                        return validator(
                                            val!, 10, 40, "instagram url");
                                      },
                                    ),
                                    CustomDialogColorPicker(
                                        deviceInfo: widget.deviceInfo),
                                    CustomTypeMenu(
                                      onChanged: (val) {},
                                      typeMenu: typeMenu,
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "الجائزة الأولى",
                                      textEditingController:
                                          firstAwardController,
                                      validator: (val) {
                                        return validator(
                                            val!, 2, 5, "first award");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "نسبة الحسم",
                                      textEditingController:
                                          discountRateController,
                                      validator: (val) {
                                        return validator(
                                            val!, 0, 2, "discount rate");
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                const Text("صورة الشعار"),
                                                InkWell(
                                                  onTap: () async {
                                                    // fileLogo =
                                                    //     await getImageFromGallray(
                                                    //         xfileLogo!);
                                                    // bloc.add(UploadImageEvent(
                                                    //     image: fileLogo!));
                                                    startWebFilePicker();
                                                  },
                                                  child: Container(
                                                    height: widget.deviceInfo
                                                            .localHeight! /
                                                        7,
                                                    width: widget
                                                        .deviceInfo.localWidth!,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .secoundColorOne
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: _bytesData == null
                                                        ? const Icon(Icons.add,
                                                            color: AppColors
                                                                .greyShadeTwo)
                                                        : Image.memory(_bytesData!,
                                                            fit: BoxFit.fill),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                const Text("الصورة الرئيسية"),
                                                InkWell(
                                                  onTap: () async {
                                                    fileMainImage =
                                                        await getImageFromGallray(
                                                            xfileMainImage!);
                                                  },
                                                  child: Container(
                                                    height: widget.deviceInfo
                                                            .localHeight! /
                                                        7,
                                                    width: widget
                                                        .deviceInfo.localWidth!,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .secoundColorOne
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: fileMainImage == null
                                                        ? const Icon(Icons.add,
                                                            color: AppColors
                                                                .greyShadeTwo)
                                                        : Image.network(
                                                            fileMainImage!.path,
                                                            fit: BoxFit.fill),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Column(
                                        children: [
                                          const Text("صورة الخلفية"),
                                          InkWell(
                                            onTap: () async {
                                              fileBackgroundImage =
                                                  await getImageFromGallray(
                                                      xfileBackgroundImage!);
                                            },
                                            child: Container(
                                              height: widget
                                                      .deviceInfo.localHeight! /
                                                  7,
                                              width:
                                                  widget.deviceInfo.localWidth!,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .secoundColorOne
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: fileBackgroundImage == null
                                                  ? const Icon(Icons.add,
                                                      color: AppColors
                                                          .greyShadeTwo)
                                                  : Image.network(
                                                      fileBackgroundImage!.path,
                                                      fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ])
                    : PageView(
                        reverse: true,
                        physics: const ScrollPhysics(),
                        onPageChanged: widget.onPageChanged,
                        scrollDirection: Axis.horizontal,
                        controller: widget.pageController,
                        children: [
                            SizedBox(
                              width: 500,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: GridView(
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 5,
                                          childAspectRatio: 4),
                                  children: [
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "اسم المستخدم",
                                      textEditingController: userNameController,
                                      validator: (val) {
                                        return validator(
                                            val!, 3, 30, "user name");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "اسم المطعم",
                                      textEditingController:
                                          resturantNameController,
                                      validator: (val) {
                                        return validator(
                                            val!, 3, 20, "resturant name");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "كلمة المرور",
                                      obscureText: true,
                                      textEditingController: passwordController,
                                      validator: (val) {
                                        return validator(
                                            val!, 8, 30, "password");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      obscureText: true,
                                      label: "تأكيد كلمة المرور",
                                      textEditingController:
                                          repasswordController,
                                      validator: (val) {
                                        return validator(
                                            val!, 8, 30, "confirm password");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "مدة الاشتراك",
                                      textEditingController:
                                          supscriptionTimeController,
                                      validator: (val) {
                                        return validator(
                                            val!, 1, 5, "month duration");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "رقم الهاتف ",
                                      textEditingController: phoneController,
                                      validator: (val) {
                                        return validator(val!, 10, 30, "phone");
                                      },
                                    ),
                                    CustomDropDownCities(
                                      typeCity: city,
                                      onChanged: (val) {
                                        city = val!;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 500,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: GridView(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.4,
                                          crossAxisSpacing: 5),
                                  children: [
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "رابط الفيسبوك",
                                      textEditingController:
                                          faceBookLinkController,
                                      validator: (val) {
                                        return validator(
                                            val!, 10, 40, "facebook url");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "رابط الانستغرام",
                                      textEditingController:
                                          instagarmLinkController,
                                      validator: (val) {
                                        return validator(
                                            val!, 10, 40, "instagram url");
                                      },
                                    ),
                                    CustomDialogColorPicker(
                                        deviceInfo: widget.deviceInfo),
                                    CustomTypeMenu(
                                      onChanged: (val) {},
                                      typeMenu: typeMenu,
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "الجائزة الأولى",
                                      textEditingController:
                                          firstAwardController,
                                      validator: (val) {
                                        return validator(
                                            val!, 2, 5, "first award");
                                      },
                                    ),
                                    CustomTextFormFaildDialog(
                                      deviceInfo: widget.deviceInfo,
                                      label: "نسبة الحسم",
                                      textEditingController:
                                          discountRateController,
                                      validator: (val) {
                                        return validator(
                                            val!, 0, 2, "discount rate");
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                const Text("صورة الشعار"),
                                                InkWell(
                                                  onTap: () async {
                                                    fileLogo =
                                                        await getImageFromGallray(
                                                            xfileLogo!);
                                                  },
                                                  child: Container(
                                                    height: widget.deviceInfo
                                                            .localHeight! /
                                                        7,
                                                    width: widget
                                                        .deviceInfo.localWidth!,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .secoundColorOne
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: fileLogo == null
                                                        ? const Icon(Icons.add,
                                                            color: AppColors
                                                                .greyShadeTwo)
                                                        : Image.network(
                                                            fileLogo!.path,
                                                            fit: BoxFit.fill),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                const Text("الصورة الرئيسية"),
                                                InkWell(
                                                  onTap: () async {
                                                    fileMainImage =
                                                        await getImageFromGallray(
                                                            xfileMainImage!);
                                                  },
                                                  child: Container(
                                                    height: widget.deviceInfo
                                                            .localHeight! /
                                                        7,
                                                    width: widget
                                                        .deviceInfo.localWidth!,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .secoundColorOne
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: fileMainImage == null
                                                        ? const Icon(Icons.add,
                                                            color: AppColors
                                                                .greyShadeTwo)
                                                        : Image.network(
                                                            fileMainImage!.path,
                                                            fit: BoxFit.fill),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Column(
                                        children: [
                                          const Text("صورة الخلفية"),
                                          InkWell(
                                            onTap: () async {
                                              fileBackgroundImage =
                                                  await getImageFromGallray(
                                                      xfileBackgroundImage!);
                                            },
                                            child: Container(
                                              height: widget
                                                      .deviceInfo.localHeight! /
                                                  7,
                                              width:
                                                  widget.deviceInfo.localWidth!,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .secoundColorOne
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: fileBackgroundImage == null
                                                  ? const Icon(Icons.add,
                                                      color: AppColors
                                                          .greyShadeTwo)
                                                  : Image.network(
                                                      fileBackgroundImage!.path,
                                                      fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
              ),
            );
          },
        ),
      ),
    );
  }
}

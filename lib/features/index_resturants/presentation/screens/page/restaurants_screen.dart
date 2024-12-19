import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rivo_admin_app/core/constant/colors.dart';
import 'package:rivo_admin_app/core/constant/images.dart';
import 'package:rivo_admin_app/core/enum/device_type.dart';
import 'package:rivo_admin_app/core/widgets/information_table_desk.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/effective_button.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/search_add.dart';

import '../../../../../core/constant/info_widget.dart';
import '../../../../../core/widgets/information_table.dart';
import '../../../../../core/widgets/text_title.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  late final TextEditingController searchController;
  bool isSwitched = false;
  bool _canPop = false;
  @override
  void initState() {
    searchController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColorGreenAcssent,
          title: const Text(
            'Rivo',
            style: TextStyle(
              color: AppColors.greyShadeTwo,
              fontFamily: "ArbFONTS-Almarai-ExtraBold",
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: SvgPicture.asset(AppImages.logoWhite),
          actions: [
            Icon(
              Icons.view_headline,
              color: AppColors.greyShadeTwo,
              size: deviceInfo.localHeight! / 20,
            )
          ],
        ),
        body: WillPopScope(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: deviceInfo.deviceType == DeviceType.Mobile
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceInfo.localWidth! / 15,
                      vertical: deviceInfo.localHeight! / 28,
                    ),
                    child: ListView(children: [
                      TextTitle(
                        title: "المطاعم",
                        fontSize: deviceInfo.localWidth! / 20,
                        color: AppColors.textColorBlack,
                      ),
                      SizedBox(
                        height: deviceInfo.localHeight! / 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EffectiveButton(
                            deviceInfo: deviceInfo,
                            isPressed: true,
                            title: 'الفعالة',
                            effectiveFun: () {},
                          ),
                          SizedBox(
                            width: deviceInfo.localWidth! / 6,
                          ),
                          EffectiveButton(
                            deviceInfo: deviceInfo,
                            isPressed: false,
                            title: 'المنتهية',
                            effectiveFun: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceInfo.localHeight! / 40,
                      ),
                      SearchAdd(
                          serachFun: () {},
                          searchController: searchController,
                          deviceInfo: deviceInfo),
                      const SizedBox(
                        height: 20,
                      ),
                      InformationTable(
                        deviceInfo: deviceInfo,
                      ),
                    ]),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceInfo.localWidth! / 12,
                      vertical: deviceInfo.localHeight! / 28,
                    ),
                    child: ListView(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextTitle(
                                title: "المطاعم",
                                fontSize: deviceInfo.localHeight! / 26,
                                color: AppColors.textColorBlack,
                              ),
                              SizedBox(
                                height: deviceInfo.localHeight! / 50,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  EffectiveButton(
                                    deviceInfo: deviceInfo,
                                    isPressed: true,
                                    title: 'الفعالة',
                                    effectiveFun: () {},
                                  ),
                                  SizedBox(
                                    width: deviceInfo.localWidth! / 18,
                                  ),
                                  EffectiveButton(
                                    deviceInfo: deviceInfo,
                                    isPressed: false,
                                    title: 'المنتهية',
                                    effectiveFun: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SearchAdd(
                              serachFun: () {},
                              searchController: searchController,
                              deviceInfo: deviceInfo),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InformationTableDesk(
                        deviceInfo: deviceInfo,
                      ),
                    ]),
                  ),
          ),
          onWillPop: () async {
            if (_canPop) {
              return true;
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Alert"),
                  content: Text("Are you sure you want to exit?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _canPop = true;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Yes"),
                    ),
                  ],
                ),
              );
              return false;
            }
          },
        ),
      ),
    );
  }
}

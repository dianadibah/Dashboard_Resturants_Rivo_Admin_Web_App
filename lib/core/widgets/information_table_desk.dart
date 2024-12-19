import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/bloc/index_resturants_bloc.dart';

import '../constant/colors.dart';
import '../constant/images.dart';
import '../models/device_info.dart';
import 'text_title.dart';

class InformationTableDesk extends StatefulWidget {
  final DeviceInfo deviceInfo;

  const InformationTableDesk({
    super.key,
    required this.deviceInfo,
  });

  @override
  State<InformationTableDesk> createState() => _InformationTableDeskState();
}

class _InformationTableDeskState extends State<InformationTableDesk> {
  final List<String> titlesList = [
    'اسم المستخدم',
    'اسم المطعم',
    'تاريخ انتهاء الاشتراك',
    'الحدث',
  ];
  late IndexResturantsBloc indexResturantsBloc;

  @override
  void initState() {
    indexResturantsBloc = IndexResturantsBloc()..add(GetIndexResturantsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => indexResturantsBloc,
      child: BlocBuilder<IndexResturantsBloc, IndexResturantsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: widget.deviceInfo.localWidth! * 1.55,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  )),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ...List.generate(
                        titlesList.length,
                        (index) => SizedBox(
                          width: widget.deviceInfo.localWidth! / 5,
                          child: TextTitle(
                            title: titlesList[index],
                            fontSize: widget.deviceInfo.localHeight! / 60,
                            color: AppColors.textColorBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                state.indexRestutrantStatus == IndexRestutrantStatus.success
                    ? Column(
                        children: [
                          ...List.generate(
                            state.resturantList.length +
                                (state.isEndPage ? 1 : 0),
                            (index) {
                              if (state.resturantList.length == index) {
                                BlocProvider.of<IndexResturantsBloc>(context)
                                    .add(GetIndexResturantsEvent());

                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Container(
                                  height:
                                      widget.deviceInfo.localHeight! / 13.33,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  )),
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            widget.deviceInfo.localWidth! / 5,
                                        child: Text(
                                          state.resturantList[index]
                                              .adminResturant!.username!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(height: 2),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            widget.deviceInfo.localWidth! / 5,
                                        child: Text(
                                          state.resturantList[index].name!
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(height: 2),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            widget.deviceInfo.localWidth! / 5,
                                        child: Text(
                                          state.resturantList[index]
                                              .subscriptions!.endDate!
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(height: 2),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            widget.deviceInfo.localWidth! / 5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                AppImages.view,
                                                color: AppColors
                                                    .primaryColorGreenAcssent,
                                                height: widget.deviceInfo
                                                        .localHeight! /
                                                    60,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                AppImages.edit,
                                                color: AppColors
                                                    .primaryColorGreenAcssent,
                                                height: widget.deviceInfo
                                                        .localHeight! /
                                                    60,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                AppImages.profile,
                                                color: AppColors
                                                    .primaryColorGreenAcssent,
                                                height: widget.deviceInfo
                                                        .localHeight! /
                                                    60,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: FlutterSwitch(
                                                valueFontSize: 10,
                                                height: widget.deviceInfo
                                                        .localHeight! /
                                                    10,
                                                width: 70,
                                                showOnOff: true,
                                                value:
                                                    state.restrantStatus[index],
                                                activeText: "Off",
                                                inactiveText: "On",
                                                toggleSize: widget.deviceInfo
                                                        .localHeight! /
                                                    50,
                                                padding: 10,
                                                activeTextColor:
                                                    AppColors.textColorBlack,
                                                inactiveTextColor:
                                                    AppColors.textColorBlack,
                                                inactiveColor:
                                                    AppColors.greyShadeTwo,
                                                activeColor:
                                                    AppColors.greyShadeTwo,
                                                activeTextFontWeight:
                                                    FontWeight.normal,
                                                inactiveTextFontWeight:
                                                    FontWeight.normal,
                                                activeToggleColor: AppColors
                                                    .primaryColorGreenAcssent,
                                                inactiveToggleColor:
                                                    AppColors.textColorWhite,
                                                onToggle: (val) {
                                                  if (val == false) {
                                                    BlocProvider.of<
                                                                IndexResturantsBloc>(
                                                            context)
                                                        .add(UnActivateResturantStatusEvent(
                                                            resturantStatus:
                                                                val,
                                                            resturantId: state
                                                                .resturantList[
                                                                    index]
                                                                .id!));
                                                  } else {
                                                    BlocProvider.of<
                                                                IndexResturantsBloc>(
                                                            context)
                                                        .add(ActivateResturantStatusEvent(
                                                            resturantStatus:
                                                                val,
                                                            resturantId: state
                                                                .resturantList[
                                                                    index]
                                                                .id!));
                                                  }
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      )
                    : state.indexRestutrantStatus ==
                                IndexRestutrantStatus.failure &&
                            state.resturantList.isEmpty
                        ? Center(child: Text(state.message))
                        : const Center(
                            child: CircularProgressIndicator(),
                          )
              ],
            ),
          );
        },
      ),
    );
  }
}

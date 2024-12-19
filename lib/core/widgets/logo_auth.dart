import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/colors.dart';
import '../constant/images.dart';
import '../constant/info_widget.dart';

class CustomLogoAuth extends StatelessWidget {
  final String authTypeName;
  const CustomLogoAuth({super.key, required this.authTypeName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: InfoWidget(builder: (context, deviceType) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceType.localHeight! / 3,
              width: deviceType.localWidth! / 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.logoGreen,
                    allowDrawingOutsideViewBox: true,
                    height: deviceType.localHeight! / 11,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rivo Admin App",
                    style: TextStyle(
                        color: AppColors.primaryColorGreen,
                        fontFamily: "ArbFONTS-Almarai-ExtraBold",
                        fontWeight: FontWeight.bold,
                        fontSize: deviceType.localHeight! * 0.03),
                  ),
                  Text(
                    authTypeName,
                    style: TextStyle(
                        color: AppColors.primaryColorGreen,
                        fontFamily: "ArbFONTS-Almarai-ExtraBold",
                        fontWeight: FontWeight.bold,
                        fontSize: deviceType.localHeight! * 0.03),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

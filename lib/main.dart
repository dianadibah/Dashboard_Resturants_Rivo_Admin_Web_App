import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:rivo_admin_app/app_router.dart';
import 'package:rivo_admin_app/injection.dart';

import 'core/constant/colors.dart';

void main()async {
  await init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColorGreen,
        datePickerTheme: DatePickerThemeData(
            rangeSelectionBackgroundColor: AppColors.primaryColorGreen,
            rangeSelectionOverlayColor:
                const MaterialStatePropertyAll(AppColors.primaryColorGreen),
            rangePickerHeaderBackgroundColor: AppColors.primaryColorGreen,
            dividerColor: AppColors.primaryColorGreen,
            rangePickerBackgroundColor: AppColors.primaryColorGreen,
            dayOverlayColor: MaterialStatePropertyAll(
                AppColors.primaryColorGreenAcssent.withOpacity(0.5)),
            elevation: 0.2,
            surfaceTintColor: AppColors.primaryColorGreen,
            todayForegroundColor: const MaterialStatePropertyAll(
                AppColors.primaryColorGreenAcssent)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: BotToastInit(),

      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}

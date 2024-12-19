import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/info_widget.dart';
import '../../../core/constant/routes.dart';
import '../../../core/widgets/background_splash.dart';
import '../../../injection.dart';
import '../bloc/splash_bloc.dart';
import '../widgets/body_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashBloc splashBloc;
  @override
  void initState() {
    splashBloc = sl<SplashBloc>()..add(CheckAuthEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: splashBloc,
      child: Scaffold(
        backgroundColor: AppColors.primaryColorGreenAcssent,
        body: BlocConsumer<SplashBloc, SplashState>(builder: (context, state) {
          return InfoWidget(builder: (context, deviceType) {
            return SizedBox(
              height: deviceType.screenHeight,
              width: deviceType.screenWidth,
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  CustomBackGroundSplash(),
                  CustomBodySplashScreen(),
                ],
              ),
            );
          });
        }, listener: (context, state) async {
          if (state.authStatus == AuthStatus.auth) {
            await Future.delayed(const Duration(seconds: 3));
            context.goNamed(AppRoutes.restauratsScreen);
          } else if (state.authStatus == AuthStatus.unAuth) {
            await Future.delayed(const Duration(seconds: 3));
            context.pushReplacementNamed(AppRoutes.login);
          }
        }),
      ),
    );
  }
}

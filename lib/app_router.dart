import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rivo_admin_app/features/auth/presentation/login/page/login_screen.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/bloc/index_resturants_bloc.dart';
import 'package:rivo_admin_app/features/splash_screen/page/splash_screen.dart';

import 'core/constant/routes.dart';
import 'features/index_resturants/presentation/screens/page/restaurants_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: AppRoutes.splashScreen,
      path: "/",
      builder: (context, state) => const Directionality(
          textDirection: TextDirection.rtl, child: SplashScreen()),
    ),
    GoRoute(
      name: AppRoutes.login,
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: AppRoutes.restauratsScreen,
      path: AppRoutes.restauratsScreen,
      builder: (context, state) => BlocProvider(
          create: (context) =>
              IndexResturantsBloc()..add(GetIndexResturantsEvent()),
          child: const RestaurantsScreen()),
    ),
  ],
);

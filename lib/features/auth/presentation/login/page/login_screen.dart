import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rivo_admin_app/core/enum/device_type.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/images.dart';
import '../../../../../core/constant/info_widget.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../core/constant/toast.dart';
import '../../../../../core/functions/validat.dart';
import '../../../../../core/widgets/background_auth.dart';
import '../../../../../core/widgets/logo_auth.dart';
import '../../../../../core/widgets/text_form_faild copy.dart';
import '../../../domain/usecases/login.dart';
import '../bloc/login_bloc.dart';
import '../widgets/botton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    loginBloc = LoginBloc();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child:
              BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
            if (state.loginStatus == LoginStatus.loading) {
              log("success loading");
              Toast.showLoading();
            } else if (state.loginStatus == LoginStatus.failure) {
              log("failur loading");
              Toast.closeAllLoading();
              Toast.showText(text:state.message);
            } else if (state.loginStatus == LoginStatus.success) {
              log("success ui");
              Toast.closeAllLoading();
              context.pushNamed(AppRoutes.splashScreen);
            }
          }, builder: ((context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InfoWidget(builder: (context, deviceType) {
                  return Form(
                      key: _formKey,
                      child: deviceType.deviceType == DeviceType.Mobile
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                const BackGroundAuthScreen(),
                                const CustomLogoAuth(
                                    authTypeName: "تسجيل الدخول"),
                                InfoWidget(builder: (context, devicetype) {
                                  return SizedBox(
                                    height: deviceType.localHeight,
                                    width: deviceType.localWidth!,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomBottonAuth(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              BlocProvider.of<LoginBloc>(
                                                      context)
                                                  .add(GetLoginEvent(
                                                      LoginParams(
                                                          username:
                                                              userNameController
                                                                  .text,
                                                          password:
                                                              passwordController
                                                                  .text)));
                                            }
                                          },
                                          deviceInfo: deviceType,
                                          title: 'تسجيل الدخول',
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: deviceType.localWidth! / 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextFormFaild(
                                          hintText: "اسم المستخدم",
                                          textEditingController:
                                              userNameController,
                                          validator: (val) {
                                            return validator(
                                                val!, 3, 20, "Name");
                                          }),
                                            const SizedBox(
                                            height: 10,
                                          ),
                                      CustomTextFormFaild(
                                          obscureText: true,
                                          hintText: "كلمة المرور",
                                          textEditingController:
                                              passwordController,
                                          validator: (val) {
                                            return validator(
                                                val!, 8, 20, "Password");
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                const BackGroundAuthScreen(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: deviceType.localWidth! / 3,
                                      height: deviceType.localHeight! / 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "تسجيل الدخول",
                                            style: TextStyle(
                                                color:
                                                    AppColors.primaryColorGreen,
                                                fontFamily:
                                                    "ArbFONTS-Almarai-ExtraBold",
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    deviceType.localHeight! *
                                                        0.05),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          CustomTextFormFaild(
                                              hintText: "اسم المستخدم",
                                              textEditingController:
                                                  userNameController,
                                              validator: (val) {
                                                return validator(
                                                    val!, 3, 20, "Name");
                                              }),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextFormFaild(
                                              obscureText: true,
                                              hintText: "كلمة المرور",
                                              textEditingController:
                                                  passwordController,
                                              validator: (val) {
                                                return validator(
                                                    val!, 5, 20, "Password");
                                              }),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: deviceType.localWidth! / 3.5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                CustomBottonAuth(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      BlocProvider.of<
                                                                  LoginBloc>(
                                                              context)
                                                          .add(GetLoginEvent(LoginParams(
                                                              username:
                                                                  userNameController
                                                                      .text,
                                                              password:
                                                                  passwordController
                                                                      .text)));
                                                    }
                                                  },
                                                  deviceInfo: deviceType,
                                                  title: 'تسجيل الدخول',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: deviceType.localHeight! / 3,
                                          width: deviceType.localWidth! / 2.5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                AppImages.logoGreen,
                                                allowDrawingOutsideViewBox:
                                                    true,
                                                height:
                                                    deviceType.localHeight! / 6,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Rivo Admin App",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .primaryColorGreen,
                                                    fontFamily:
                                                        "ArbFONTS-Almarai-ExtraBold",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: deviceType
                                                            .localHeight! *
                                                        0.05),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ));
                }),
              ),
            );
          }))),
    );
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../../../core/api/global_function.dart';
import '../../../data/repository/repo_imp.dart';
import '../../../domain/usecases/login.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final login = LoginUseCase(AuthRepositoryImp());
  LoginBloc() : super(const LoginState()) {
    on<GetLoginEvent>(_mapLoginState);
  }
  FutureOr<void> _mapLoginState(
      GetLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final result = await login(LoginParams(
        username: event.loginParams.username,
        password: event.loginParams.password));
    log("username is:${event.loginParams.username}");
    result.fold((failure) {
      emit(state.copyWith(
          loginStatus: LoginStatus.failure, message: failure.message));
      log("Failuer maessage is:${failure.message!}");
    }, (respons) {
      emit(state.copyWith(loginStatus: LoginStatus.success));
      log(respons.data!.admin!.username!);
      log(state.loginStatus.toString());
      GlobalFunctions.setToken(respons.data!.admin!.accessToken!);
      GlobalFunctions.setUserId(respons.data!.admin!.id!);
    });
  }
}

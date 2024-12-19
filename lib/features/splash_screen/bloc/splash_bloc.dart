import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/api/global_function.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<CheckAuthEvent>(_mapCheckAuthState);
  }
  FutureOr<void> _mapCheckAuthState(
      CheckAuthEvent event, Emitter<SplashState> emit) async {
    if (await GlobalFunctions.isAuth()) {
      emit(state.copyWith(authStatus: AuthStatus.auth));
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unAuth));
    }
  }
}

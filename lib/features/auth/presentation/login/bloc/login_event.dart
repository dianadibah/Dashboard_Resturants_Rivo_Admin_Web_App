part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetLoginEvent extends LoginEvent {
  final LoginParams loginParams;

  const GetLoginEvent(this.loginParams);
}

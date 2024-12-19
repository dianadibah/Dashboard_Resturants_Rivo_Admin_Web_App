// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

enum LoginStatus { success, failure, initial, loading }

class LoginState {
  final LoginStatus loginStatus;
  final String message;
  const LoginState({
    this.loginStatus = LoginStatus.initial,
    this.message = "",
  });

  LoginState copyWith({LoginStatus? loginStatus, String? message}) {
    return LoginState(
        loginStatus: loginStatus ?? this.loginStatus,
        message: message ?? this.message);
  }
}

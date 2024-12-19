// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_bloc.dart';

enum AuthStatus {  auth, unAuth }

class SplashState {
  final AuthStatus authStatus;

  SplashState({this.authStatus = AuthStatus.unAuth});

  SplashState copyWith({
    AuthStatus? authStatus,
  }) {
    return SplashState(
      authStatus: authStatus ?? this.authStatus,
    );
  }
}

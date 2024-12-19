import '../../../../core/constant/type_def.dart';
import '../../../../core/constant/usecases.dart';
import '../../data/models/outh_response.dart';
import '../repository/auth_repository.dart';

class LoginUseCase extends UseCase<AuthResponse, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  DataResponse<AuthResponse> call(params) {
    return authRepository.login(params.getBody());
  }
}

class LoginParams with Params {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
  @override
  BodyMap getBody() {
    return {
      "username": username,
      "password": password,
    };
  }
}

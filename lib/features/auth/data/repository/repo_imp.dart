

import '../../../../core/constant/type_def.dart';
import '../../../../core/errors/handling_exception_manager.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote_auth_data_source.dart';
import '../models/outh_response.dart';

class AuthRepositoryImp
    with HandlingExceptionManager
    implements AuthRepository {
  final authDataSource = RemoteAuthDataSource();
  @override
  DataResponse<AuthResponse> login(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await authDataSource.login(body);
      return result;
    });
  }


}

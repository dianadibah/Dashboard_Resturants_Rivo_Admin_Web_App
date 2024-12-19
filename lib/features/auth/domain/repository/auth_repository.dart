

import '../../../../core/constant/type_def.dart';
import '../../data/models/outh_response.dart';

abstract class AuthRepository {
  DataResponse<AuthResponse> login(BodyMap body);
}



import '../../../../core/api/api_variabeles.dart';
import '../../../../core/api/post_api.dart';
import '../../../../core/constant/type_def.dart';
import '../models/outh_response.dart';

class RemoteAuthDataSource {
  Future<AuthResponse> login(BodyMap body) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.login(), body: body, fromJson: authResponseFromJson);
    final result = await postApi.callRequest();
    return result;
  }


}

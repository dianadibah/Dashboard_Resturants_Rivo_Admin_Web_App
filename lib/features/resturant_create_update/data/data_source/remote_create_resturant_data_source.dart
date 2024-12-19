import 'package:rivo_admin_app/core/api/api_variabeles.dart';
import 'package:rivo_admin_app/core/api/post_api.dart';
import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/model/create.resturant_model.dart';

class RemoteCreateResturantDataSource {
  Future<ResturantCreateUpdateResponse> createResturant(BodyMap body) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.createResturant(),
        body: body,
        fromJson: resturantCreateUpdateResponseFromJson);
    final result = await postApi.callRequest();
    return result;
  }
 
}

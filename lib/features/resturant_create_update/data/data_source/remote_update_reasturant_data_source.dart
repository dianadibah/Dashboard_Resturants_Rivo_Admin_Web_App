import '../../../../core/api/api_variabeles.dart';
import '../../../../core/api/post_api.dart';
import '../../../../core/constant/type_def.dart';
import '../model/create.resturant_model.dart';

class RemoteUpdateResturantDataSource {
    Future<ResturantCreateUpdateResponse> updateResturant(BodyMap body,int resturantId) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.updateResturants(resturantId: resturantId),
        body: body,
        fromJson: resturantCreateUpdateResponseFromJson);
    final result = await postApi.callRequest();
    return result;
  }
}

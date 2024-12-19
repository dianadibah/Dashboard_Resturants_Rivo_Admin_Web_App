import 'package:rivo_admin_app/core/api/api_variabeles.dart';
import 'package:rivo_admin_app/core/api/post_api.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_respons.dart';

class RemoteChangeResturantStatus {
  Future<IndexResturantsResponse> activateResturant(int resturantId) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.activeIndexResturants(resturantId: resturantId),
        body: {},
        fromJson: indexResturantsResponseFromJson);
    final result = await postApi.callRequest();
    return result;
  }
   Future<IndexResturantsResponse> unActivateResturant(int resturantId) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.unActiveIndexResturants(resturantId: resturantId),
        body: {},
        fromJson: indexResturantsResponseFromJson);
    final result = await postApi.callRequest();
    return result;
  }
}

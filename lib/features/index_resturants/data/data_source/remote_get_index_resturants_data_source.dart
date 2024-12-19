import 'package:rivo_admin_app/core/api/api_variabeles.dart';
import 'package:rivo_admin_app/core/api/get_api.dart';
import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_respons.dart';

class RemoteGetIndexResturantsDataSource {
  Future<IndexResturantsResponse> getIndexResturants(QueryParams params) async {
    GetApi getApi = GetApi(
        uri: ApiVariables.indexResturants(queryParam: params),
        fromJson: indexResturantsResponseFromJson);
    final result = await getApi.callRequest();
    return result;
  }
}

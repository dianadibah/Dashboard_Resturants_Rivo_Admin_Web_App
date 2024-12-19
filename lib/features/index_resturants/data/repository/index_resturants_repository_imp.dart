import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/errors/handling_exception_manager.dart';
import 'package:rivo_admin_app/features/index_resturants/data/data_source/remote_change_resturant_status.dart';
import 'package:rivo_admin_app/features/index_resturants/data/data_source/remote_get_index_resturants_data_source.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_respons.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/index_resturants_repository.dart';

class IndexResturantsRepositoryImp
    with HandlingExceptionManager
    implements IndexResturantsRepository {
  final indexResturantsDataSource = RemoteGetIndexResturantsDataSource();
  final remoteChangeResturantStatus = RemoteChangeResturantStatus();

  @override
  DataResponse<IndexResturantsResponse> getIndexResturants(QueryParams params) {
    return wrapHandling(tryCall: () async {
      final result = await indexResturantsDataSource.getIndexResturants(params);
      return result;
    });
  }

  @override
  DataResponse<IndexResturantsResponse> activateResturant(
      int resturantId) async {
    return wrapHandling(tryCall: () async {
      final result =
          await remoteChangeResturantStatus.activateResturant(resturantId);
      return result;
    });
  }

  @override
  DataResponse<IndexResturantsResponse> unActivateResturant(int resturantId) {
    return wrapHandling(tryCall: () async {
      final result =
          await remoteChangeResturantStatus.unActivateResturant(resturantId);
      return result;
    });
  }
}

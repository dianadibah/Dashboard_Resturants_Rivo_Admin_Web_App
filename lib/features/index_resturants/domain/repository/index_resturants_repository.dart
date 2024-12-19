import '../../../../core/constant/type_def.dart';
import '../../data/model/index_resturants_respons.dart';

abstract class IndexResturantsRepository {
  DataResponse<IndexResturantsResponse> getIndexResturants(QueryParams params);
  DataResponse<IndexResturantsResponse> activateResturant(int resturantId);
  DataResponse<IndexResturantsResponse> unActivateResturant(int paresturantIdrams);


}

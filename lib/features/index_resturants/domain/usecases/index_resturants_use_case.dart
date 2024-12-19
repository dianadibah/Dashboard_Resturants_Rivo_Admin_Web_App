import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/constant/usecases.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_respons.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/index_resturants_repository.dart';

class GetIndexResturantsUseCase
    extends UseCase<IndexResturantsResponse, IndexResturantsParams> {
  final IndexResturantsRepository indexResturantsRepository;

  GetIndexResturantsUseCase(this.indexResturantsRepository);
  @override
  DataResponse<IndexResturantsResponse> call(IndexResturantsParams params)async {
    return await indexResturantsRepository.getIndexResturants(params.getParams());
  }
}

class IndexResturantsParams with Params {
  final int? page;
  final int? perPage;

  IndexResturantsParams({this.page, this.perPage});
  @override
  QueryParams getParams() {
    return {"page": page.toString(), "perPage": perPage.toString()};
  }
}

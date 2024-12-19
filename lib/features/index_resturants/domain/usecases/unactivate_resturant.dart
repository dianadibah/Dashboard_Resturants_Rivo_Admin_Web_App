import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/constant/usecases.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_respons.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/index_resturants_repository.dart';

import 'activate_resturant.dart';

class UnActivateResturantUseCase
    extends UseCase<IndexResturantsResponse, ResturantStatusParam> {
  final IndexResturantsRepository indexResturantsRepository;

  UnActivateResturantUseCase(this.indexResturantsRepository);
  @override
  DataResponse<IndexResturantsResponse> call(
      ResturantStatusParam params) async {
    return indexResturantsRepository.unActivateResturant(params.resturantId!);
  }
}


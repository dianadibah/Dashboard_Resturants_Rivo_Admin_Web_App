import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/constant/usecases.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/model/create.resturant_model.dart';
import 'package:rivo_admin_app/features/resturant_create_update/domain/repository/resturant_create_update_repository.dart';

class CreateResturantUseCase
    extends UseCase<ResturantCreateUpdateResponse, CreateResturantsParams> {
  final ResturantCreateUpdateRepository resturantCreateUpdateRepository;

  CreateResturantUseCase(this.resturantCreateUpdateRepository);

  @override
  DataResponse<ResturantCreateUpdateResponse> call(
      CreateResturantsParams params) async {
    return resturantCreateUpdateRepository.createResturant(params.getBody());
  }
}

class CreateResturantsParams with Params {
  final String name;
  final String color;
  final String logo;
  final String background;
  final String username;
  final String password;
  final String passwordConfirmation;
  final String phone;
  final String address;
  final String facebookUrl;
  final String instagramUrl;
  final String banner;
  final String discountPercent;
  final String templeteId;
  final String firstAward;
  final String durationMonths;

  CreateResturantsParams(
      {required this.name,
      required this.firstAward,
      required this.color,
      required this.logo,
      required this.background,
      required this.username,
      required this.password,
      required this.passwordConfirmation,
      required this.phone,
      required this.address,
      required this.facebookUrl,
      required this.instagramUrl,
      required this.banner,
      required this.discountPercent,
      required this.templeteId,
      required this.durationMonths});

  @override
  BodyMap getBody() {
    return {
      "name": name,
      "color": color,
      "phone": phone,
      "logo": logo,
      "banner":banner,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "username": username,
      "duration_months": durationMonths,
      "background": background,
      "templete_id": templeteId,
      "address": address,
      "facebook_url": facebookUrl,
      "instagram_url": instagramUrl,
      "discount_precent": discountPercent,
      "first_award": firstAward,
    };
  }
}

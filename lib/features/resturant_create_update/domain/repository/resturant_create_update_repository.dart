import 'dart:io';

import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/model/create.resturant_model.dart';

import '../../data/model/image_upload_model.dart';

abstract class ResturantCreateUpdateRepository {
  DataResponse<ResturantCreateUpdateResponse> createResturant(BodyMap body);
  DataResponse<ResturantCreateUpdateResponse> updateResturant(
      BodyMap body, int resturantId);
  DataResponse<ImageUploadResponse> uploadImage( BodyMap body,File image);
}

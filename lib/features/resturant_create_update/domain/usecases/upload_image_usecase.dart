import 'dart:io';

import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/constant/usecases.dart';
import 'package:rivo_admin_app/features/resturant_create_update/domain/repository/resturant_create_update_repository.dart';

import '../../data/model/image_upload_model.dart';

class UploadImageUseCase
    extends UseCase<ImageUploadResponse, ImageUploadParam> {
  final ResturantCreateUpdateRepository resturantCreateUpdateRepository;

  UploadImageUseCase(this.resturantCreateUpdateRepository);
  @override
  DataResponse<ImageUploadResponse> call(ImageUploadParam params) async {
    return resturantCreateUpdateRepository.uploadImage(params.getBody(),params.image);
  }
}

class ImageUploadParam with Params {
  final File image;

  ImageUploadParam({required this.image});
  @override
  BodyMap getBody() {
    return {"media": image.path};
  }
}

import 'dart:io';

import 'package:rivo_admin_app/core/api/api_variabeles.dart';
import 'package:rivo_admin_app/core/api/multi_post_api.dart';
import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/model/image_upload_model.dart';

class RemoteUploadImageDataSource {
  Future<ImageUploadResponse> uploadImage(BodyMap body, File image) async {
    MultiPostApi postApi = MultiPostApi(
        uri: ApiVariables.uploadImage(),
        body: body,
        image: image,
        fromJson: imageUploadResponseFromJson);
    final result = await postApi.callRequest();
    return result;
  }
}

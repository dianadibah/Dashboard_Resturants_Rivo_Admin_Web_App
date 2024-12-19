import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/errors/handling_exception_manager.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/data_source/remote_create_resturant_data_source.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/data_source/remote_update_reasturant_data_source.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/data_source/remote_upload_image_data_source.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/model/create.resturant_model.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/model/image_upload_model.dart';
import 'package:rivo_admin_app/features/resturant_create_update/domain/repository/resturant_create_update_repository.dart';

class ResturantCreateUpdateRepositryImp
    with HandlingExceptionManager
    implements ResturantCreateUpdateRepository {
  final createRequest = RemoteCreateResturantDataSource();
  final updateRequest = RemoteUpdateResturantDataSource();
  final uploadImagedatasource = RemoteUploadImageDataSource();
  @override
  DataResponse<ResturantCreateUpdateResponse> createResturant(
      BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await createRequest.createResturant(body);
      return result;
    });
  }

  @override
  DataResponse<ResturantCreateUpdateResponse> updateResturant(
      BodyMap body, int resturantId) {
    return wrapHandling(tryCall: () async {
      final result = await updateRequest.updateResturant(body, resturantId);
      return result;
    });
  }

  @override
  DataResponse<ImageUploadResponse> uploadImage(BodyMap body, File image) {
    
    return wrapHandling(tryCall: () async {
      final result = await uploadImagedatasource.uploadImage(body, image);
      return result;
    });
  }
}

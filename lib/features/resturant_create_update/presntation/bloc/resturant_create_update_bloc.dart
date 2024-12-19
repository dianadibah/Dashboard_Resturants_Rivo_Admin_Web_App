import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivo_admin_app/features/resturant_create_update/data/repository/resturant_create_update_repository_imp.dart';
import 'package:rivo_admin_app/features/resturant_create_update/domain/usecases/create_resturant_usecase.dart';
import 'package:rivo_admin_app/features/resturant_create_update/domain/usecases/update_resturant_usecase.dart';
import 'package:rivo_admin_app/features/resturant_create_update/domain/usecases/upload_image_usecase.dart';

part 'resturant_create_update_event.dart';
part 'resturant_create_update_state.dart';

class ResturantCreateUpdateBloc
    extends Bloc<ResturantCreateUpdateEvent, ResturantCreateUpdateState> {
  final createUseCase =
      CreateResturantUseCase(ResturantCreateUpdateRepositryImp());
  final updateUseCase =
      UpdateResturantUseCase(ResturantCreateUpdateRepositryImp());
  final uploadImageUseCase =
      UploadImageUseCase(ResturantCreateUpdateRepositryImp());
  ResturantCreateUpdateBloc() : super(const ResturantCreateUpdateState()) {
    on<CreateResturantEvent>(_mapCreateResturant);
    on<UpdateResturantEvent>(_mapUpdateResturant);
    on<ChangeColorEvent>(_mapChangeColorEvent);
    on<UploadImageEvent>(_mapUploadImage);
  }
  FutureOr<void> _mapCreateResturant(CreateResturantEvent event,
      Emitter<ResturantCreateUpdateState> emit) async {
    emit(state.copyWith(createResturantStatus: CreateResturantStatus.loading));
    final result = await createUseCase(event.createResturantsParams);
    result.fold(
        (failure) => emit(state.copyWith(
            createResturantStatus: CreateResturantStatus.failure,
            messageErrorForCreate: failure.message)), (respons) {
      emit(state.copyWith(
        createResturantStatus: CreateResturantStatus.success,
      ));
    });
  }

  FutureOr<void> _mapUpdateResturant(UpdateResturantEvent event,
      Emitter<ResturantCreateUpdateState> emit) async {}
  FutureOr<void> _mapChangeColorEvent(
      ChangeColorEvent event, Emitter<ResturantCreateUpdateState> emit) async {
    emit(state.copyWith(
        currentColor: event.currentColor, pickerColor: event.pickerColor));
  }

  FutureOr<void> _mapUploadImage(
      UploadImageEvent event, Emitter<ResturantCreateUpdateState> emit) async {
    var result = await uploadImageUseCase(ImageUploadParam(image: event.image));
    result.fold((l) {
      print("Erroor====${l.message}");
    }, (r) {
      print("Success====${r.success}");
    });
  }
}

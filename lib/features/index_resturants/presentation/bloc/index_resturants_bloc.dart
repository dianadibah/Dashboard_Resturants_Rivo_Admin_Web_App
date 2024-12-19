import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_respons.dart';
import 'package:rivo_admin_app/features/index_resturants/data/repository/index_resturants_repository_imp.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/usecases/activate_resturant.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/usecases/unactivate_resturant.dart';

import '../../domain/usecases/index_resturants_use_case.dart';

part 'index_resturants_event.dart';
part 'index_resturants_state.dart';

class IndexResturantsBloc
    extends Bloc<IndexResturantsEvent, IndexResturantsState> {
  final _perPage = 10;
  final getIndexResturantsUseCase =
      GetIndexResturantsUseCase(IndexResturantsRepositoryImp());
  final activateResturantUseCase =
      ActivateResturantUseCase(IndexResturantsRepositoryImp());
  final unActivateResturantUseCase =
      UnActivateResturantUseCase(IndexResturantsRepositoryImp());
  IndexResturantsBloc() : super(const IndexResturantsState()) {
    on<GetIndexResturantsEvent>(_mapGetIndexResturants);
    on<ActivateResturantStatusEvent>(_mapActivateResturantStatus);
    on<UnActivateResturantStatusEvent>(_mapUnActivateResturantStatus);
  }
  FutureOr<void> _mapGetIndexResturants(
      GetIndexResturantsEvent event, Emitter<IndexResturantsState> emit) async {
    if (state.indexRestutrantStatus == IndexRestutrantStatus.initial ||
        event.isReload) {
      emit(
          state.copyWith(indexRestutrantStatus: IndexRestutrantStatus.loading));
      final result = await getIndexResturantsUseCase(
          IndexResturantsParams(page: 1, perPage: _perPage));
      result.fold(
          (failure) => emit(state.copyWith(
              indexRestutrantStatus: IndexRestutrantStatus.failure,
              message: failure.message)), (respons) {
        final list = List.of(state.restrantStatus);
        for (var element in respons.data!.resturants!) {
          list.add(element.status == 1 ? true : false);
        }
        emit(state.copyWith(
            indexRestutrantStatus: IndexRestutrantStatus.success,
            resturantList: respons.data!.resturants,
            isEndPage: respons.data!.resturants!.length < _perPage,
            restrantStatus: list));
      });
    } else if (!state.isEndPage) {
      emit(
          state.copyWith(indexRestutrantStatus: IndexRestutrantStatus.loading));
      final result = await getIndexResturantsUseCase(IndexResturantsParams(
          page: state.resturantList.length ~/ _perPage + 1, perPage: _perPage));
      result.fold(
          (failure) => emit(state.copyWith(
              indexRestutrantStatus: IndexRestutrantStatus.failure,
              message: failure.message)), (respons) {
        final list = List.of(state.restrantStatus);
        for (var element in respons.data!.resturants!) {
          list.add(element.status == 1 ? true : false);
        }
        emit(
          state.copyWith(
              indexRestutrantStatus: IndexRestutrantStatus.success,
              resturantList: List.of(state.resturantList)
                ..addAll(respons.data!.resturants!),
              isEndPage: respons.data!.resturants!.length < _perPage,
              restrantStatus: list),
        );
        log(state.resturantList.length.toString());
      });
    }
  }

  FutureOr<void> _mapActivateResturantStatus(ActivateResturantStatusEvent event,
      Emitter<IndexResturantsState> emit) async {
    for (int i = 0; i < state.resturantList.length; i++) {
      if (state.resturantList[i].id == event.resturantId) {
        final result = await activateResturantUseCase(
            ResturantStatusParam(resturantId: event.resturantId));
        result.fold(
            (failure) => emit(state.copyWith(
                activeRestutrantStatus: ActiveRestutrantStatus.failure)),
            (resulte) {
          List<bool> list = List.of(state.restrantStatus);
          list[i] = event.resturantStatus;
          emit(state.copyWith(
              activeRestutrantStatus: ActiveRestutrantStatus.success,
              restrantStatus: list));
        });
      }
    }
  }

  FutureOr<void> _mapUnActivateResturantStatus(
      UnActivateResturantStatusEvent event,
      Emitter<IndexResturantsState> emit) async {
    for (int i = 0; i < state.resturantList.length; i++) {
      if (state.resturantList[i].id == event.resturantId) {
        final result = await unActivateResturantUseCase(
            ResturantStatusParam(resturantId: event.resturantId));
        result.fold(
            (failure) => emit(state.copyWith(
                unActiveRestutrantStatus: UnActiveRestutrantStatus.failure)),
            (resulte) {
          List<bool> list = List.of(state.restrantStatus);
          list[i] = event.resturantStatus;
          emit(state.copyWith(
              unActiveRestutrantStatus: UnActiveRestutrantStatus.success,
              restrantStatus: list));
        });
      }
    }
  }

 
}

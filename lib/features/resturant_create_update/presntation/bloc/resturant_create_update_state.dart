// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resturant_create_update_bloc.dart';

enum CreateResturantStatus { initial, success, failure, loading }

enum UpdateResturantStatus { initial, success, failure, loading }

class ResturantCreateUpdateState {
  final CreateResturantStatus createResturantStatus;
  final UpdateResturantStatus updateResturantStatus;
  final int currentPage;
  final String messageErrorForCreate;
  final String messageErrorForUpdate;
  final Color pickerColor;
  final Color currentColor;

  const ResturantCreateUpdateState(
      {this.createResturantStatus = CreateResturantStatus.initial,
      this.updateResturantStatus = UpdateResturantStatus.initial,
      this.currentPage = 0,
      this.messageErrorForCreate = "",
      this.messageErrorForUpdate = "",
      this.currentColor = const Color(0xffffffff),
      this.pickerColor = const Color(0xffffffff)});

  ResturantCreateUpdateState copyWith(
      {CreateResturantStatus? createResturantStatus,
      UpdateResturantStatus? updateResturantStatus,
      int? currentPage,
      String? messageErrorForCreate,
      String? messageErrorForUpdate,
      Color? pickerColor,
      Color? currentColor}) {
    return ResturantCreateUpdateState(
        createResturantStatus:
            createResturantStatus ?? this.createResturantStatus,
        updateResturantStatus:
            updateResturantStatus ?? this.updateResturantStatus,
        currentPage: currentPage ?? this.currentPage,
        messageErrorForCreate:
            messageErrorForCreate ?? this.messageErrorForCreate,
        messageErrorForUpdate:
            messageErrorForUpdate ?? this.messageErrorForUpdate,
        currentColor: currentColor ?? this.currentColor,
        pickerColor: pickerColor ?? this.pickerColor);
  }
}

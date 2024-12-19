part of 'resturant_create_update_bloc.dart';

class ResturantCreateUpdateEvent {
  const ResturantCreateUpdateEvent();
}

class CreateResturantEvent extends ResturantCreateUpdateEvent {
  final CreateResturantsParams createResturantsParams;

  CreateResturantEvent({required this.createResturantsParams});
}

class UpdateResturantEvent extends ResturantCreateUpdateEvent {
  final UpdateResturantsParams updateResturantsParams;

  UpdateResturantEvent({required this.updateResturantsParams});
}

class ChangeColorEvent extends ResturantCreateUpdateEvent {
  final Color? currentColor;
  final Color? pickerColor;
  ChangeColorEvent({this.currentColor, this.pickerColor});
}

class UploadImageEvent extends ResturantCreateUpdateEvent {
  final File image;

  UploadImageEvent({required this.image});
}

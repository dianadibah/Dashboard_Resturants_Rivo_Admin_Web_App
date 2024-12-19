part of 'index_resturants_bloc.dart';

sealed class IndexResturantsEvent {
  const IndexResturantsEvent();
}

class GetIndexResturantsEvent extends IndexResturantsEvent {
  final bool isReload;

  GetIndexResturantsEvent({this.isReload = false});
}

class ActivateResturantStatusEvent extends IndexResturantsEvent {
  final bool resturantStatus;
  final int resturantId;

  ActivateResturantStatusEvent(
      {required this.resturantStatus, required this.resturantId});
}

class UnActivateResturantStatusEvent extends IndexResturantsEvent {
  final bool resturantStatus;
  final int resturantId;

  UnActivateResturantStatusEvent({
    required this.resturantStatus,
    required this.resturantId,
  });
}



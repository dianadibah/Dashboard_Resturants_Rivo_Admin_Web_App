// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'index_resturants_bloc.dart';

enum IndexRestutrantStatus { initial, success, failure, loading }

enum ActiveRestutrantStatus { initial, success, failure }

enum UnActiveRestutrantStatus { initial, success, failure }

class IndexResturantsState {
  final IndexRestutrantStatus indexRestutrantStatus;
  final bool isEndPage;
  final List<Resturant> resturantList;
  final String message;
  final List<bool> restrantStatus;
  final ActiveRestutrantStatus activeRestutrantStatus;
  final UnActiveRestutrantStatus unActiveRestutrantStatus;
  const IndexResturantsState(
      {this.indexRestutrantStatus = IndexRestutrantStatus.initial,
      this.isEndPage = false,
      this.resturantList = const [],
      this.message = "",
      this.restrantStatus = const [],
      this.activeRestutrantStatus = ActiveRestutrantStatus.initial,
      this.unActiveRestutrantStatus = UnActiveRestutrantStatus.initial});

  IndexResturantsState copyWith({
    IndexRestutrantStatus? indexRestutrantStatus,
    bool? isEndPage,
    List<Resturant>? resturantList,
    String? message,
    List<bool>? restrantStatus,
    ActiveRestutrantStatus? activeRestutrantStatus,
    UnActiveRestutrantStatus? unActiveRestutrantStatus,
  }) {
    return IndexResturantsState(
      indexRestutrantStatus:
          indexRestutrantStatus ?? this.indexRestutrantStatus,
      isEndPage: isEndPage ?? this.isEndPage,
      resturantList: resturantList ?? this.resturantList,
      message: message ?? this.message,
      restrantStatus: restrantStatus ?? this.restrantStatus,
      activeRestutrantStatus:
          activeRestutrantStatus ?? this.activeRestutrantStatus,
      unActiveRestutrantStatus:
          unActiveRestutrantStatus ?? this.unActiveRestutrantStatus,
    );
  }
}

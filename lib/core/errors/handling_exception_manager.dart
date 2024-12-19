import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../constant/type_def.dart';
import '../errors/exceptions.dart';
import 'failures.dart';

mixin HandlingExceptionManager {
  DataResponse<T> wrapHandling<T>({
    required Future<T> Function() tryCall,
    Future<T?> Function()? tryCallLocal,
  }) async {
    try {
      final right = await tryCall();
      return Right(right);
    } on UnauthenticatedExeption {
      log("<< catch >> Unauthenticated Error ");
      return const Left(UnauthenticatedFailure());
    } on ServerException catch (e) {
      if (tryCallLocal != null) {
        final result = await tryCallLocal();
        if (result != null) {
          return Right(result);
        } else {
          return Left(ServerFailure(e.message));
        }
      } else {
        return  Left(ServerFailure(e.message));
      }
    }
  }
}

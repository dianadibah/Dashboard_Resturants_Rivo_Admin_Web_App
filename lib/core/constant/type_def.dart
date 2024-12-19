import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

typedef QueryParams = Map<String, String>;
typedef BodyMap = Map<String, dynamic>;
typedef DataResponse<T> = Future<Either<Failure, T>>;
typedef FromJson<T> = T Function(String body);

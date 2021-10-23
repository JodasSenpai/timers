import 'package:dartz/dartz.dart';
import 'package:timers/core/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class InputConverter {
  Either<IFailure, int> stringToInteger(String str) {
    try {
      return right(int.parse(str));
    } on FormatException {
      return left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends IFailure {}

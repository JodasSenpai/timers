import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';

/// ! Assign the Params generic type to Null when no parameters are needed
/// e.g.: implements UseCase<Approver, Null> and call([Null params])
abstract class UseCase<Type, Params> {
  Future<Either<IFailure, Type>> call(Params params);
}

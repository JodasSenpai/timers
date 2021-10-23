import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/domain/approver/approver.dart';

abstract class IApproverRepository {
  Future<Either<IFailure, Approver>> getRandomApprover();

  Future<Either<IFailure, List<Approver>>> getAllApproversExceptSelf(
      String currentUser);
}

import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/domain/core/usecase.dart';

import '../approver.dart';
import '../approver_repository.dart';

class GetAllApproversExceptSelf implements UseCase<List<Approver>, String> {
  final IApproverRepository repository;

  GetAllApproversExceptSelf(this.repository);

  @override
  Future<Either<IFailure, List<Approver>>> call(String currentUser) async {
    return await repository.getAllApproversExceptSelf(currentUser);
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/domain/core/usecase.dart';
import 'package:injectable/injectable.dart';

import '../approver.dart';
import '../approver_repository.dart';

@lazySingleton
class GetRandomApprover implements UseCase<Approver, Null> {
  final IApproverRepository repository;

  GetRandomApprover(this.repository);

  @override
  Future<Either<IFailure, Approver>> call([Null params]) async {
    return await repository.getRandomApprover();
  }
}

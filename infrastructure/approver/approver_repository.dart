import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/domain/approver/approver.dart';
import 'package:flutter_template/domain/approver/approver_repository.dart';
import 'package:flutter_template/infrastructure/core/error/exception.dart';
import 'package:flutter_template/infrastructure/core/error/failure.dart';
import 'package:flutter_template/infrastructure/core/network_info.dart';
import 'package:injectable/injectable.dart';

import 'approver_dto.dart';
import 'datasource/approver_local_data_source.dart';
import 'datasource/approver_remote_data_source.dart';

@LazySingleton(as: IApproverRepository)
class ApproverRepository implements IApproverRepository {
  final IApproverLocalDataSource localDataSource;
  final IApproverRemoteDataSource remoteDataSource;
  final INetworkInfo networkInfo;

  const ApproverRepository({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<IFailure, Approver>> getRandomApprover() async {
    if (await networkInfo.isConnected) {
      try {
        final ApproverDto approverDto =
            await remoteDataSource.getRandomApprover();
        localDataSource.cacheApprover(approverDto);
        return right(approverDto.toDomain());
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final ApproverDto approverDto = await localDataSource.getLastApprover();
        return right(approverDto.toDomain());
      } on CacheException {
        return left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<IFailure, List<Approver>>> getAllApproversExceptSelf(
      String params) {
    // TODO: implement getAllApprovers
    throw UnimplementedError();
  }
}

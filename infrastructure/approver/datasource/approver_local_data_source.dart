import 'dart:convert';

import 'package:flutter_template/domain/approver/approver.dart';
import 'package:flutter_template/infrastructure/approver/approver_dto.dart';
import 'package:flutter_template/infrastructure/core/error/exception.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

abstract class IApproverLocalDataSource {
  /// Gets the cached [Approver] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<ApproverDto> getLastApprover();

  /// Caches an instance of [Approver] into a local datastore
  ///
  /// Throws [CacheException] if persisting into the datastore failed
  Future<void> cacheApprover(ApproverDto approver);
}

@LazySingleton(as: IApproverLocalDataSource)
class ApproverLocalDataSourceImpl implements IApproverLocalDataSource {
  static const String CACHE_BOX = "APPROVER_CACHE";
  static const String APPROVER_CACHED = "CACHED_APPROVER";

  final HiveInterface hive;

  const ApproverLocalDataSourceImpl(this.hive);

  @override
  Future<ApproverDto> getLastApprover() async {
    try {
      var box = await hive.openBox(CACHE_BOX);
      final String? jsonString = box.get(APPROVER_CACHED);
      if (jsonString != null) {
        return Future.value(
          ApproverDto.fromJson(
            json.decode(jsonString),
          ),
        );
      } else {
        throw CacheException();
      }
    } on HiveError {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheApprover(ApproverDto approver) async {
    try {
      var box = await hive.openBox(CACHE_BOX);
      return box.put(
          APPROVER_CACHED,
          json.encode(
            approver.toJson(),
          ));
    } on HiveError {
      throw CacheException();
    }
  }
}

import 'dart:convert';

import 'package:flutter_template/infrastructure/core/error/exception.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../approver_dto.dart';

abstract class IApproverRemoteDataSource {
  /// Calls the /users/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ApproverDto> getRandomApprover();
}

@LazySingleton(as: IApproverRemoteDataSource)
class ApproverRemoteDataSourceImpl implements IApproverRemoteDataSource {
  final http.Client client;

  const ApproverRemoteDataSourceImpl(this.client);

  @override
  Future<ApproverDto> getRandomApprover() async {
    // * 10.0.2.2 is localhost outside android virtual device
    final response = await client.get(
      // ! localhost Web
      // Uri.parse("http://127.0.0.1:8080/merge"),
      // ! localhost AVD
      // Uri.parse("http://10.0.2.2:8080/merge"),
      // ! Openshift
      Uri.parse("http://smd-dev-merge.apps.srcopenshift1.src.si/merge"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return ApproverDto.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}

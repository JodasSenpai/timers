import 'package:flutter_template/domain/approver/approver.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_dto.freezed.dart';

part 'approver_dto.g.dart';

@freezed
class ApproverDto with _$ApproverDto {
  const factory ApproverDto({required String name, required String surname}) =
      _ApproverDto;

  factory ApproverDto.fromJson(Map<String, dynamic> json) =>
      _$ApproverDtoFromJson(json);

  factory ApproverDto.fromDomain(Approver approver) {
    return ApproverDto(
      name: approver.name,
      surname: approver.surname,
    );
  }
}

extension ApproverDtoX on ApproverDto {
  Approver toDomain() {
    return Approver(
      name: name,
      surname: surname,
    );
  }
}

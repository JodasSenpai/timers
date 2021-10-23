import 'package:equatable/equatable.dart';

class Approver extends Equatable {
  final String name;
  final String surname;

  const Approver({
    required this.name,
    required this.surname,
  });

  @override
  List<Object> get props => [name, surname];
}

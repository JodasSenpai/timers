import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final List properties;

  IFailure({this.properties = const <dynamic>[]});

  @override
  List<Object> get props => [properties];
}
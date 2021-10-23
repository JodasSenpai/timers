part of 'approver_bloc.dart';

abstract class ApproverBlocState extends Equatable {
  const ApproverBlocState();

  @override
  List<Object> get props => [];
}

class InitialState extends ApproverBlocState {}

class LoadingState extends ApproverBlocState {}

class LoadedState extends ApproverBlocState {
  final String approver;

  const LoadedState(this.approver);

  @override
  List<Object> get props => super.props..addAll([approver]);
}

class ErrorState extends ApproverBlocState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => super.props..addAll([message]);
}

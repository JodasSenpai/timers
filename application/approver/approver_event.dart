part of 'approver_bloc.dart';

abstract class ApproverEvent extends Equatable {
  const ApproverEvent();

  List<Object?> get props => [];
}

class GetRandomApproverEvent extends ApproverEvent {}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/domain/approver/approver.dart';
import 'package:flutter_template/domain/approver/usecase/get_random_approver_usecase.dart';
import 'package:flutter_template/infrastructure/core/error/failure.dart';
import 'package:injectable/injectable.dart';

part 'approver_event.dart';
part 'approver_state.dart';

@injectable
class ApproverBloc extends Bloc<ApproverEvent, ApproverBlocState> {
//! this can return error codes that should be localised in presentation layer
  static const String SERVER_FAULURE_MESSAGE = "Server failure";
  static const String CACHE_FAULURE_MESSAGE = "Cache failure";
  static const String GENERAL_FAULURE_MESSAGE = "Unpredicted failure";

  final GetRandomApprover getRandomApprover;

  ApproverBloc(this.getRandomApprover) : super(InitialState());

  @override
  Stream<ApproverBlocState> mapEventToState(
    ApproverEvent event,
  ) async* {
    yield LoadingState();

    Either<IFailure, Approver> result = await getRandomApprover();
    yield* result.fold(
      (failure) async* {
        yield ErrorState(_mapFailureToMessage(failure));
      },
      (approver) async* {
        yield LoadedState("${approver.name} ${approver.surname}");
      },
    );
  }

  String _mapFailureToMessage(IFailure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAULURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAULURE_MESSAGE;
      default:
        return GENERAL_FAULURE_MESSAGE;
    }
  }
}

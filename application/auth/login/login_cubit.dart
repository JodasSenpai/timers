import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/domain/auth/auth_repository.dart';
import 'package:flutter_template/domain/core/value_object/email.dart';
import 'package:flutter_template/domain/core/value_object/password.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final IAuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    var loginState = await _authenticationRepository.logInWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
    );
    loginState.fold(
          () => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
          (failure) => emit(state.copyWith(status: FormzStatus.submissionFailure)),
    );
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    var loginState = await _authenticationRepository.logInWithGoogle();
    loginState.fold(
          () => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
          (failure) =>
          emit(state.copyWith(status: FormzStatus.submissionFailure)),
    );
  }
}

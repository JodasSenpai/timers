import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/domain/auth/user.dart';

/// Repository which manages user authentication.
abstract class IAuthenticationRepository {
  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user;

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser;

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Returns a [SignUpFailure] if an exception occurs.
  Future<Option<IFailure>> signUp(
      {required String email, required String password});

  /// Starts the Sign In with Google Flow.
  ///
  /// Returns a [LogInWithGoogleFailure] if an exception occurs.
  Future<Option<IFailure>> logInWithGoogle();

  /// Signs in with the provided [email] and [password].
  ///
  /// Returns a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<Option<IFailure>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Returns a [LogOutFailure] if an exception occurs.
  Future<Option<IFailure>> logOut();
}

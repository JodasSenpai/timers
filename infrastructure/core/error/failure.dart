import 'package:flutter_template/core/error/failure.dart';

class ServerFailure extends IFailure {}

class CacheFailure extends IFailure {}

/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure extends IFailure {}

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure extends IFailure {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure extends IFailure {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure extends IFailure {}

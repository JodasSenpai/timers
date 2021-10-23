import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/domain/auth/auth_repository.dart';
import 'package:flutter_template/domain/auth/user.dart';
import 'package:flutter_template/infrastructure/core/error/failure.dart';
import 'package:flutter_template/infrastructure/core/generic_cache_client.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository({
    required this.cache,
    required this.googleSignIn,
    required this.firebaseAuth,
  });

  final ICacheClient cache;
  final GoogleSignIn googleSignIn;
  final firebase_auth.FirebaseAuth firebaseAuth;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = 'CACHED_USER';

  @override
  Stream<User> get user {
    return firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  @override
  User get currentUser {
    return cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  @override
  Future<Option<IFailure>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return none();
    } on Exception {
      return some(SignUpFailure());
    }
  }

  @override
  Future<Option<IFailure>> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await firebaseAuth.signInWithPopup(
          googleProvider,
        );

        if (userCredential.credential != null) {
          credential = userCredential.credential!;
        } else {
          return some(LogInWithGoogleFailure());
        }
      } else {
        final googleUser = await googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      await firebaseAuth.signInWithCredential(credential);
      return none();
    } on Exception {
      return some(LogInWithGoogleFailure());
    }
  }

  @override
  Future<Option<IFailure>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return none();
    } on Exception {
      return some(LogInWithEmailAndPasswordFailure());
    }
  }

  @override
  Future<Option<IFailure>> logOut() async {
    try {
      await Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);
      return none();
    } on Exception {
      return some(LogOutFailure());
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}

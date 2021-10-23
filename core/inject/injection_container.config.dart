// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:hive_flutter/adapters.dart' as _i7;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i12;

import '../../application/approver/approver_bloc.dart' as _i21;
import '../../application/auth/app_bloc.dart' as _i19;
import '../../application/auth/login/login_cubit.dart' as _i17;
import '../../application/auth/sign_up/sign_up_cubit.dart' as _i18;
import '../../application/core/util/input_converter.dart' as _i11;
import '../../domain/approver/approver_repository.dart' as _i13;
import '../../domain/approver/usecase/get_random_approver_usecase.dart' as _i20;
import '../../domain/auth/auth_repository.dart' as _i15;
import '../../infrastructure/approver/approver_repository.dart' as _i14;
import '../../infrastructure/approver/datasource/approver_local_data_source.dart'
    as _i6;
import '../../infrastructure/approver/datasource/approver_remote_data_source.dart'
    as _i8;
import '../../infrastructure/auth/authentication_repository.dart' as _i16;
import '../../infrastructure/core/generic_cache_client.dart' as _i9;
import '../../infrastructure/core/network_info.dart' as _i10;
import 'injection_container.dart' as _i22;

const String _web = 'web';
const String _webDisabled = 'webDisabled';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Client>(() => registerModule.client);
  gh.lazySingleton<_i4.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i5.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i6.IApproverLocalDataSource>(
      () => _i6.ApproverLocalDataSourceImpl(get<_i7.HiveInterface>()));
  gh.lazySingleton<_i8.IApproverRemoteDataSource>(
      () => _i8.ApproverRemoteDataSourceImpl(get<_i3.Client>()));
  gh.lazySingleton<_i9.ICacheClient>(() => _i9.CacheClient());
  gh.lazySingleton<_i10.INetworkInfo>(() => _i10.NetworkInfoWebImpl(),
      registerFor: {_web});
  gh.lazySingleton<_i11.InputConverter>(() => _i11.InputConverter());
  gh.lazySingleton<_i12.InternetConnectionChecker>(() => registerModule.icc);
  gh.lazySingleton<_i13.IApproverRepository>(() => _i14.ApproverRepository(
      localDataSource: get<_i6.IApproverLocalDataSource>(),
      remoteDataSource: get<_i8.IApproverRemoteDataSource>(),
      networkInfo: get<_i10.INetworkInfo>()));
  gh.lazySingleton<_i15.IAuthenticationRepository>(() =>
      _i16.AuthenticationRepository(
          cache: get<_i9.ICacheClient>(),
          googleSignIn: get<_i5.GoogleSignIn>(),
          firebaseAuth: get<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i10.INetworkInfo>(
      () => _i10.NetworkInfoImpl(get<_i12.InternetConnectionChecker>()),
      registerFor: {_webDisabled});
  gh.factory<_i17.LoginCubit>(
      () => _i17.LoginCubit(get<_i15.IAuthenticationRepository>()));
  gh.factory<_i18.SignUpCubit>(
      () => _i18.SignUpCubit(get<_i15.IAuthenticationRepository>()));
  gh.factory<_i19.AppBloc>(() => _i19.AppBloc(
      authenticationRepository: get<_i15.IAuthenticationRepository>()));
  gh.lazySingleton<_i20.GetRandomApprover>(
      () => _i20.GetRandomApprover(get<_i13.IApproverRepository>()));
  gh.factory<_i21.ApproverBloc>(
      () => _i21.ApproverBloc(get<_i20.GetRandomApprover>()));
  return get;
}

class _$RegisterModule extends _i22.RegisterModule {}

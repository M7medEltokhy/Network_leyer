// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/cubit/login_cubit.dart' as _i796;
import '../../features/auth/repo/auth_repo.dart' as _i109;
import '../network/clients/dio_client.dart' as _i466;
import '../network/network_info.dart' as _i932;
import '../network/retrofit/api_service.dart' as _i318;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final connectivityModule = _$ConnectivityModule();
    final networkModule = _$NetworkModule();
    final apiServiceModule = _$ApiServiceModule();
    gh.lazySingleton<_i895.Connectivity>(() => connectivityModule.connectivity);
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfo(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i932.NetworkInfo>()),
    );
    gh.lazySingleton<_i318.ApiService>(
      () => apiServiceModule.apiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i109.AuthRepo>(
      () => _i109.AuthRepo(gh<_i318.ApiService>()),
    );
    gh.factory<_i796.LoginCubit>(() => _i796.LoginCubit(gh<_i109.AuthRepo>()));
    return this;
  }
}

class _$ConnectivityModule extends _i932.ConnectivityModule {}

class _$NetworkModule extends _i466.NetworkModule {}

class _$ApiServiceModule extends _i318.ApiServiceModule {}

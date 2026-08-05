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

import '../../features/auth/data/datasources/auth_api_client.dart' as _i552;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/presentation/cubit/login_cubit.dart' as _i69;
import '../../features/auth/presentation/cubit/otp_cubit.dart' as _i1033;
import '../../features/upload/data/datasources/upload_remote_data_source.dart'
    as _i429;
import '../../features/upload/data/repos/upload_repo_impl.dart' as _i174;
import '../../features/upload/domain/repos/upload_repo.dart' as _i710;
import '../../features/upload/domain/usecases/upload_image_usecase.dart'
    as _i710;
import '../../features/upload/presentation/cubit/upload_cubit.dart' as _i895;
import '../network/interceptors/connectivity_interceptor.dart' as _i693;
import '../network/network_info.dart' as _i932;
import '../network/retrofit/upload_api_service.dart' as _i46;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfo(gh<_i895.Connectivity>()),
    );
    gh.factory<_i693.ConnectivityInterceptor>(
      () => _i693.ConnectivityInterceptor(gh<_i932.NetworkInfo>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i693.ConnectivityInterceptor>()),
    );
    gh.lazySingleton<_i552.AuthApiClient>(
      () => registerModule.authApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i46.UploadApiService>(
      () => registerModule.uploadApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i429.UploadRemoteDataSource>(
      () => _i429.UploadRemoteDataSource(gh<_i46.UploadApiService>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i552.AuthApiClient>()),
    );
    gh.lazySingleton<_i710.UploadRepo>(
      () => _i174.UploadRepoImpl(gh<_i429.UploadRemoteDataSource>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i710.UploadImageUseCase>(
      () => _i710.UploadImageUseCase(gh<_i710.UploadRepo>()),
    );
    gh.factory<_i895.UploadCubit>(
      () => _i895.UploadCubit(gh<_i710.UploadImageUseCase>()),
    );
    gh.factory<_i69.LoginCubit>(
      () => _i69.LoginCubit(gh<_i188.LoginUseCase>()),
    );
    gh.factory<_i1033.OtpCubit>(
      () => _i1033.OtpCubit(gh<_i188.LoginUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

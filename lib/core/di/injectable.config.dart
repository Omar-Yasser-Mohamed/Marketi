// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:marketi/core/helpers/connectivity_helper.dart' as _i14;
import 'package:marketi/core/network/api_service.dart' as _i352;
import 'package:marketi/core/network/dio_service.dart' as _i951;
import 'package:marketi/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i244;
import 'package:marketi/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart'
    as _i6;
import 'package:marketi/features/auth/data/repos/auth_repo_impl.dart' as _i62;
import 'package:marketi/features/auth/domain/repos/auth_repo.dart' as _i377;
import 'package:marketi/features/auth/presentation/cubits/login_cubit/login_cubit.dart'
    as _i315;
import 'package:marketi/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart'
    as _i597;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i14.ConnectivityHelper>(() => _i14.ConnectivityHelper());
    gh.lazySingleton<_i951.DioService>(() => _i951.DioService());
    gh.lazySingleton<_i352.ApiService>(() => _i352.ApiService(
          gh<_i951.DioService>(),
          gh<_i14.ConnectivityHelper>(),
        ));
    gh.lazySingleton<_i244.AuthRemoteDataSource>(
        () => _i6.AuthRemoteDataSourceImpl(gh<_i352.ApiService>()));
    gh.lazySingleton<_i377.AuthRepo>(
        () => _i62.AuthRepoImpl(gh<_i244.AuthRemoteDataSource>()));
    gh.lazySingleton<_i315.LoginCubit>(
        () => _i315.LoginCubit(gh<_i377.AuthRepo>()));
    gh.lazySingleton<_i597.SignupCubit>(
        () => _i597.SignupCubit(gh<_i377.AuthRepo>()));
    return this;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:marketi/core/network/api_service.dart' as _i352;
import 'package:marketi/core/network/dio_client.dart' as _i750;
import 'package:marketi/core/token/token_service.dart' as _i547;
import 'package:marketi/core/token/token_service_impl.dart' as _i79;
import 'package:marketi/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i312;
import 'package:marketi/features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i483;
import 'package:marketi/features/auth/data/repos/auth_repo_impl.dart' as _i62;
import 'package:marketi/features/auth/domain/repos/auth_repo.dart' as _i377;
import 'package:marketi/features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i442;
import 'package:marketi/features/auth/domain/use_cases/login_use_case.dart'
    as _i356;
import 'package:marketi/features/auth/domain/use_cases/register_use_case.dart'
    as _i995;
import 'package:marketi/features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i391;
import 'package:marketi/features/auth/domain/use_cases/verify_otp_use_case.dart'
    as _i629;
import 'package:marketi/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart'
    as _i53;
import 'package:marketi/features/auth/presentation/cubits/login_cubit/login_cubit.dart'
    as _i315;
import 'package:marketi/features/auth/presentation/cubits/register_cubit/register_cubit.dart'
    as _i726;
import 'package:marketi/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart'
    as _i895;
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/verify_otp_cubit.dart'
    as _i358;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i750.DioClient>(() => _i750.DioClient());
    gh.lazySingleton<_i547.TokenService>(() => _i79.TokenServiceImpl());
    gh.lazySingleton<_i352.ApiService>(
      () => _i352.ApiService(gh<_i750.DioClient>()),
    );
    gh.lazySingleton<_i312.AuthRemoteDataSource>(
      () => _i483.AuthRemoteDataSourceImpl(gh<_i352.ApiService>()),
    );
    gh.lazySingleton<_i377.AuthRepo>(
      () => _i62.AuthRepoImpl(
        gh<_i312.AuthRemoteDataSource>(),
        gh<_i547.TokenService>(),
      ),
    );
    gh.lazySingleton<_i442.ForgetPasswordUseCase>(
      () => _i442.ForgetPasswordUseCase(gh<_i377.AuthRepo>()),
    );
    gh.lazySingleton<_i356.LoginUseCase>(
      () => _i356.LoginUseCase(gh<_i377.AuthRepo>()),
    );
    gh.lazySingleton<_i995.RegisterUseCase>(
      () => _i995.RegisterUseCase(gh<_i377.AuthRepo>()),
    );
    gh.lazySingleton<_i391.ResetPasswordUseCase>(
      () => _i391.ResetPasswordUseCase(gh<_i377.AuthRepo>()),
    );
    gh.lazySingleton<_i629.VerifyOtpUseCase>(
      () => _i629.VerifyOtpUseCase(gh<_i377.AuthRepo>()),
    );
    gh.factory<_i895.ResetPasswordCubit>(
      () => _i895.ResetPasswordCubit(gh<_i391.ResetPasswordUseCase>()),
    );
    gh.factory<_i726.RegisterCubit>(
      () => _i726.RegisterCubit(gh<_i995.RegisterUseCase>()),
    );
    gh.factory<_i358.VerifyOtpCubit>(
      () => _i358.VerifyOtpCubit(gh<_i629.VerifyOtpUseCase>()),
    );
    gh.factory<_i53.ForgetPasswordCubit>(
      () => _i53.ForgetPasswordCubit(gh<_i442.ForgetPasswordUseCase>()),
    );
    gh.factory<_i315.LoginCubit>(
      () => _i315.LoginCubit(gh<_i356.LoginUseCase>()),
    );
    return this;
  }
}

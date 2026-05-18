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
import 'package:marketi/core/shared/token/token_service.dart' as _i1028;
import 'package:marketi/core/shared/token/token_service_impl.dart' as _i364;
import 'package:marketi/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i244;
import 'package:marketi/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart'
    as _i6;
import 'package:marketi/features/auth/data/repos/auth_repo_impl.dart' as _i62;
import 'package:marketi/features/auth/domain/repos/auth_repo.dart' as _i377;
import 'package:marketi/features/auth/domain/services/email_flow.dart' as _i977;
import 'package:marketi/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart'
    as _i53;
import 'package:marketi/features/auth/presentation/cubits/login_cubit/login_cubit.dart'
    as _i315;
import 'package:marketi/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart'
    as _i895;
import 'package:marketi/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart'
    as _i597;
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/otp_timer_cubit.dart'
    as _i449;
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/verify_otp_cubit.dart'
    as _i358;
import 'package:marketi/features/cart/data/data_sources/local/gps_local_data_source.dart'
    as _i605;
import 'package:marketi/features/cart/data/data_sources/remote/cart_remote_data_source.dart'
    as _i862;
import 'package:marketi/features/cart/data/data_sources/remote/cart_remote_data_source_impl.dart'
    as _i196;
import 'package:marketi/features/cart/data/data_sources/remote/checkout_remote_data_source.dart'
    as _i778;
import 'package:marketi/features/cart/data/data_sources/remote/checkout_remote_data_source_impl.dart'
    as _i487;
import 'package:marketi/features/cart/data/data_sources/remote/location_remote_data_source.dart'
    as _i59;
import 'package:marketi/features/cart/data/repos/cart_repo_impl.dart' as _i1039;
import 'package:marketi/features/cart/data/repos/checkout_repo_impl.dart'
    as _i568;
import 'package:marketi/features/cart/data/repos/location_repo_impl.dart'
    as _i489;
import 'package:marketi/features/cart/domain/repos/cart_repo.dart' as _i307;
import 'package:marketi/features/cart/domain/repos/checkout_repo.dart' as _i608;
import 'package:marketi/features/cart/domain/repos/location_repo.dart' as _i718;
import 'package:marketi/features/cart/domain/use_cases/get_current_location_use_case.dart'
    as _i414;
import 'package:marketi/features/cart/domain/use_cases/get_location_name_use_case.dart'
    as _i97;
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart'
    as _i723;
import 'package:marketi/features/cart/presentation/cubits/checkout_cubit/checkout_cubit.dart'
    as _i362;
import 'package:marketi/features/cart/presentation/cubits/pick_location_cubit/pick_location_cubit.dart'
    as _i775;
import 'package:marketi/features/favorites/data/data_sources/remote/fav_remote_data_source.dart'
    as _i689;
import 'package:marketi/features/favorites/data/data_sources/remote/fav_remote_data_source_impl.dart'
    as _i713;
import 'package:marketi/features/favorites/data/repos/fav_repo_impl.dart'
    as _i276;
import 'package:marketi/features/favorites/domain/repos/fav_repo.dart' as _i370;
import 'package:marketi/features/favorites/presentation/cubits/fav_cubit/fav_cubit.dart'
    as _i366;
import 'package:marketi/features/home/data/data_source/remote/brands_remote_data_source.dart'
    as _i822;
import 'package:marketi/features/home/data/data_source/remote/category_remote_data_source.dart'
    as _i643;
import 'package:marketi/features/home/data/data_source/remote/products_remote_data_source.dart'
    as _i517;
import 'package:marketi/features/home/data/repos/brands_repo_impl.dart'
    as _i624;
import 'package:marketi/features/home/data/repos/categories_repo_impl.dart'
    as _i742;
import 'package:marketi/features/home/data/repos/products_repo_impl.dart'
    as _i184;
import 'package:marketi/features/home/domain/repos/brands_repo.dart' as _i605;
import 'package:marketi/features/home/domain/repos/categories_repo.dart'
    as _i229;
import 'package:marketi/features/home/domain/repos/products_repo.dart' as _i423;
import 'package:marketi/features/home/domain/use_cases/all_products_use_case.dart'
    as _i898;
import 'package:marketi/features/home/domain/use_cases/brands_use_case.dart'
    as _i281;
import 'package:marketi/features/home/domain/use_cases/cach_products_use_case.dart'
    as _i321;
import 'package:marketi/features/home/domain/use_cases/categories_use_case.dart'
    as _i639;
import 'package:marketi/features/home/domain/use_cases/get_best_products_use_case.dart'
    as _i550;
import 'package:marketi/features/home/domain/use_cases/get_popular_products_use_case.dart'
    as _i637;
import 'package:marketi/features/home/domain/use_cases/sort_products_use_case.dart'
    as _i478;
import 'package:marketi/features/home/presentation/cubits/brands_cubit/brands_cubit.dart'
    as _i923;
import 'package:marketi/features/home/presentation/cubits/categories_cubit/categories_cubit.dart'
    as _i425;
import 'package:marketi/features/home/presentation/cubits/home_cubit/home_cubit.dart'
    as _i70;
import 'package:marketi/features/home/presentation/cubits/product_details_cubit/product_details_cubit.dart'
    as _i607;
import 'package:marketi/features/orders/data/data_sources/remote/orders_remote_data_source.dart'
    as _i649;
import 'package:marketi/features/orders/data/data_sources/remote/orders_remote_data_source_impl.dart'
    as _i578;
import 'package:marketi/features/orders/data/repos/orders_repo_impl.dart'
    as _i663;
import 'package:marketi/features/orders/domain/repos/orders_repo.dart' as _i335;
import 'package:marketi/features/orders/presentation/cubits/orders_cubit/orders_cubit.dart'
    as _i357;
import 'package:marketi/features/profile/data/data_source/local/profile_local_data_source.dart'
    as _i1030;
import 'package:marketi/features/profile/data/data_source/local/profile_local_data_source_impl.dart'
    as _i860;
import 'package:marketi/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i258;
import 'package:marketi/features/profile/data/data_source/remote/profile_remote_data_source_impl.dart'
    as _i636;
import 'package:marketi/features/profile/data/repos/profile_repo_impl.dart'
    as _i432;
import 'package:marketi/features/profile/domain/repos/profile_repo.dart' as _i9;
import 'package:marketi/features/profile/domain/use_cases/update_profile_use_case.dart'
    as _i571;
import 'package:marketi/features/profile/presentation/cubits/locale_cubit/locale_cubit.dart'
    as _i292;
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart'
    as _i66;
import 'package:marketi/features/profile/presentation/cubits/theme_cubit/theme_cubit.dart'
    as _i517;
import 'package:marketi/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart'
    as _i899;
import 'package:marketi/features/splash/presentation/cubits/cubit/splash_cubit.dart'
    as _i938;

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
    gh.factory<_i449.OtpTimerCubit>(() => _i449.OtpTimerCubit());
    gh.lazySingleton<_i14.ConnectivityHelper>(() => _i14.ConnectivityHelper());
    gh.lazySingleton<_i951.DioService>(() => _i951.DioService());
    gh.lazySingleton<_i977.EmailFlow>(() => _i977.EmailFlow());
    gh.lazySingleton<_i478.SortProductsUseCase>(
        () => _i478.SortProductsUseCase());
    gh.lazySingleton<_i292.LocaleCubit>(() => _i292.LocaleCubit());
    gh.lazySingleton<_i517.ThemeCubit>(() => _i517.ThemeCubit());
    gh.lazySingleton<_i1030.ProfileLocalDataSource>(
        () => _i860.ProfileLocalDataSourceImpl());
    gh.lazySingleton<_i1028.TokenService>(() => _i364.TokenServiceImpl());
    gh.lazySingleton<_i605.GpsLocalDataSource>(
        () => _i605.GpsLocalDataSourceImpl());
    gh.lazySingleton<_i951.AuthorizationInterceptor>(
        () => _i951.AuthorizationInterceptor(gh<_i1028.TokenService>()));
    gh.lazySingleton<_i352.ApiService>(() => _i352.ApiService(
          gh<_i951.DioService>(),
          gh<_i14.ConnectivityHelper>(),
        ));
    gh.lazySingleton<_i862.CartRemoteDataSource>(
        () => _i196.CartRemoteDataSourceImpl(
              gh<_i352.ApiService>(),
              gh<_i1028.TokenService>(),
            ));
    gh.lazySingleton<_i307.CartRepo>(
        () => _i1039.CartRepoImpl(gh<_i862.CartRemoteDataSource>()));
    gh.lazySingleton<_i778.CheckoutRemoteDataSource>(
        () => _i487.CheckoutRemoteDataSourceImpl(
              apiService: gh<_i352.ApiService>(),
              tokenService: gh<_i1028.TokenService>(),
            ));
    gh.lazySingleton<_i689.FavRemoteDataSource>(
        () => _i713.FavRemoteDataSourceImpl(
              gh<_i352.ApiService>(),
              gh<_i1028.TokenService>(),
            ));
    gh.lazySingleton<_i608.CheckoutRepo>(() => _i568.CheckoutRepoImpl(
        checkoutRemoteDataSource: gh<_i778.CheckoutRemoteDataSource>()));
    gh.factory<_i723.CartCubit>(() => _i723.CartCubit(gh<_i307.CartRepo>()));
    gh.lazySingleton<_i822.BrandsRemoteDataSource>(
        () => _i822.BrandsRemoteDataSourceImpl(gh<_i352.ApiService>()));
    gh.lazySingleton<_i517.ProductsRemoteDataSource>(
        () => _i517.ProductsRemoteDataSourceImpl(gh<_i352.ApiService>()));
    gh.lazySingleton<_i605.BrandsRepo>(
        () => _i624.BrandsRepoImpl(gh<_i822.BrandsRemoteDataSource>()));
    gh.lazySingleton<_i59.LocationRemoteDataSource>(
        () => _i59.LocationRemoteDataSourceImpl(gh<_i352.ApiService>()));
    gh.lazySingleton<_i643.CategoryRemoteDataSource>(
        () => _i643.CategoryRemoteDataSourceImpl(gh<_i352.ApiService>()));
    gh.lazySingleton<_i244.AuthRemoteDataSource>(
        () => _i6.AuthRemoteDataSourceImpl(
              gh<_i352.ApiService>(),
              gh<_i1028.TokenService>(),
            ));
    gh.lazySingleton<_i258.ProfileRemoteDataSource>(
        () => _i636.ProfileRemoteDataSourceImpl(
              gh<_i352.ApiService>(),
              gh<_i1028.TokenService>(),
            ));
    gh.lazySingleton<_i649.OrdersRemoteDataSource>(
        () => _i578.OrdersRemoteDataSourceImpl(
              gh<_i352.ApiService>(),
              gh<_i1028.TokenService>(),
            ));
    gh.lazySingleton<_i370.FavRepo>(
        () => _i276.FavRepoImpl(gh<_i689.FavRemoteDataSource>()));
    gh.factory<_i362.CheckoutCubit>(
        () => _i362.CheckoutCubit(gh<_i608.CheckoutRepo>()));
    gh.lazySingleton<_i423.ProductsRepo>(
        () => _i184.ProductsRepoImpl(gh<_i517.ProductsRemoteDataSource>()));
    gh.lazySingleton<_i229.CategoriesRepo>(
        () => _i742.CategoriesRepoImpl(gh<_i643.CategoryRemoteDataSource>()));
    gh.lazySingleton<_i639.CategoriesUseCase>(
        () => _i639.CategoriesUseCase(gh<_i229.CategoriesRepo>()));
    gh.factory<_i607.ProductDetailsCubit>(
        () => _i607.ProductDetailsCubit(gh<_i423.ProductsRepo>()));
    gh.lazySingleton<_i898.AllProductsUseCase>(
        () => _i898.AllProductsUseCase(gh<_i423.ProductsRepo>()));
    gh.lazySingleton<_i281.BrandsUseCase>(
        () => _i281.BrandsUseCase(gh<_i605.BrandsRepo>()));
    gh.lazySingleton<_i9.ProfileRepo>(() => _i432.ProfileRepoImpl(
          gh<_i1030.ProfileLocalDataSource>(),
          gh<_i258.ProfileRemoteDataSource>(),
        ));
    gh.lazySingleton<_i335.OrdersRepo>(
        () => _i663.OrdersRepoImpl(gh<_i649.OrdersRemoteDataSource>()));
    gh.lazySingleton<_i718.LocationRepo>(() => _i489.LocationRepoImpl(
          gh<_i59.LocationRemoteDataSource>(),
          gh<_i605.GpsLocalDataSource>(),
        ));
    gh.factory<_i425.CategoriesCubit>(
        () => _i425.CategoriesCubit(gh<_i639.CategoriesUseCase>()));
    gh.factory<_i366.FavCubit>(() => _i366.FavCubit(gh<_i370.FavRepo>()));
    gh.lazySingleton<_i377.AuthRepo>(() => _i62.AuthRepoImpl(
          gh<_i244.AuthRemoteDataSource>(),
          gh<_i1028.TokenService>(),
          gh<_i1030.ProfileLocalDataSource>(),
          gh<_i258.ProfileRemoteDataSource>(),
        ));
    gh.factory<_i923.BrandsCubit>(
        () => _i923.BrandsCubit(gh<_i281.BrandsUseCase>()));
    gh.lazySingleton<_i550.GetBestProductsUseCase>(
        () => _i550.GetBestProductsUseCase(gh<_i423.ProductsRepo>()));
    gh.lazySingleton<_i637.GetPopularProductsUseCase>(
        () => _i637.GetPopularProductsUseCase(gh<_i423.ProductsRepo>()));
    gh.lazySingleton<_i321.CachProductsUseCase>(
        () => _i321.CachProductsUseCase(gh<_i423.ProductsRepo>()));
    gh.factory<_i53.ForgetPasswordCubit>(() => _i53.ForgetPasswordCubit(
          gh<_i377.AuthRepo>(),
          gh<_i977.EmailFlow>(),
        ));
    gh.factory<_i895.ResetPasswordCubit>(() => _i895.ResetPasswordCubit(
          gh<_i377.AuthRepo>(),
          gh<_i977.EmailFlow>(),
        ));
    gh.factory<_i315.LoginCubit>(() => _i315.LoginCubit(gh<_i377.AuthRepo>()));
    gh.factory<_i597.SignupCubit>(
        () => _i597.SignupCubit(gh<_i377.AuthRepo>()));
    gh.factory<_i357.OrdersCubit>(
        () => _i357.OrdersCubit(gh<_i335.OrdersRepo>()));
    gh.lazySingleton<_i571.UpdateProfileUseCase>(
        () => _i571.UpdateProfileUseCase(gh<_i9.ProfileRepo>()));
    gh.factory<_i358.VerifyOtpCubit>(
        () => _i358.VerifyOtpCubit(gh<_i377.AuthRepo>()));
    gh.factory<_i66.ProfileCubit>(() => _i66.ProfileCubit(
          gh<_i9.ProfileRepo>(),
          gh<_i377.AuthRepo>(),
        ));
    gh.lazySingleton<_i414.GetCurrentLocationUseCase>(
        () => _i414.GetCurrentLocationUseCase(gh<_i718.LocationRepo>()));
    gh.lazySingleton<_i97.GetLocationNameUseCase>(
        () => _i97.GetLocationNameUseCase(gh<_i718.LocationRepo>()));
    gh.factory<_i938.SplashCubit>(() => _i938.SplashCubit(
          gh<_i377.AuthRepo>(),
          gh<_i1028.TokenService>(),
          gh<_i9.ProfileRepo>(),
        ));
    gh.factory<_i70.HomeCubit>(() => _i70.HomeCubit(
          gh<_i377.AuthRepo>(),
          gh<_i9.ProfileRepo>(),
          gh<_i898.AllProductsUseCase>(),
          gh<_i281.BrandsUseCase>(),
          gh<_i639.CategoriesUseCase>(),
          gh<_i637.GetPopularProductsUseCase>(),
          gh<_i550.GetBestProductsUseCase>(),
          gh<_i321.CachProductsUseCase>(),
        ));
    gh.factory<_i775.PickLocationCubit>(() => _i775.PickLocationCubit(
          gh<_i414.GetCurrentLocationUseCase>(),
          gh<_i97.GetLocationNameUseCase>(),
        ));
    gh.factory<_i899.UpdateProfileCubit>(
        () => _i899.UpdateProfileCubit(gh<_i571.UpdateProfileUseCase>()));
    return this;
  }
}

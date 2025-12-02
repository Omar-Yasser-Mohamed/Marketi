import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_all_brands_use_case.dart';

part 'all_brands_state.dart';

@Injectable()
class AllBrandsCubit extends Cubit<AllBrandsState> {
  AllBrandsCubit(this.getAllBrandsUseCase) : super(AllBrandsInitial());
  final GetAllBrandsUseCase getAllBrandsUseCase;

  void safeEmit(AllBrandsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllBrands({int page = 1}) async {
    if (page == 1) {
      safeEmit(AllBrandsLoading());
    } else {
      safeEmit(AllBrandsPaginationLoading());
    }

    final result = await getAllBrandsUseCase.call(params: page);

    result.fold(
      (failure) {
        if (page == 1) {
          safeEmit(AllBrandsFailure(failure.errorMessage));
        } else {
          safeEmit(AllBrandsPaginationFailure(failure.errorMessage));
        }
      },
      (brands) {
        safeEmit(AllBrandsSuccess(brands));
      },
    );
  }
}

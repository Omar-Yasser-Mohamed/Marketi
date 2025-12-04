import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_all_brands_use_case.dart';

part 'all_brands_state.dart';

@Injectable()
class AllBrandsCubit extends Cubit<AllBrandsState> {
  AllBrandsCubit(this.getAllBrandsUseCase) : super(AllBrandsInitial());
  final GetAllBrandsUseCase getAllBrandsUseCase;

  List<BrandEntity> allBrands = [];

  void safeEmit(AllBrandsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllBrands({int page = 1}) async {
    safeEmit(AllBrandsLoading());
    final result = await getAllBrandsUseCase.call(params: NoParam());

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(AllBrandsFailure(failure.errorMessage));
      },
      (brands) {
        allBrands = brands;
        safeEmit(AllBrandsSuccess(allBrands));
      },
    );
  }

  void searchForBrand({required String query}) {
    List<BrandEntity> brands = [];
    safeEmit(AllBrandsLoading());
    if (query.trim().isEmpty) {
      brands = allBrands;
    } else {
      brands = allBrands
          .where(
            (b) => b.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    safeEmit(AllBrandsSuccess(brands));
  }
}

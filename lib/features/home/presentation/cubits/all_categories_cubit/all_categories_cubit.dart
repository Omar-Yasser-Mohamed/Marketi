import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_all_categories_use_case.dart';

part 'all_categories_state.dart';

@Injectable()
class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit(this.getAllCategoriesUseCase)
    : super(AllCategoriesInitial());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  Future<void> getAllCategories() async {
    emit(AllCategoriesLoading());

    final result = await getAllCategoriesUseCase.call(params: NoParam());

    result.fold(
      (failure) {
        emit(AllCategoriesFailure(failure.errorMessage));
      },
      (categories) {
        emit(AllCategoriesSuccess(categories));
      },
    );
  }
}

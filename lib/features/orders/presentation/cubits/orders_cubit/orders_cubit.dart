import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/domain/repos/orders_repo.dart';

part 'orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo _ordersRepo;

  OrdersCubit(this._ordersRepo) : super(OrdersInitial());

  void safeEmit(OrdersState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllOrders() async {
    safeEmit(OrdersLoading());
    final result = await _ordersRepo.getAllOrders();
    result.fold(
      (failure) => safeEmit(OrdersFailure(failure)),
      (orders) => safeEmit(OrdersSuccess(orders)),
    );
  }
}

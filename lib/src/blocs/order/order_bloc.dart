import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimblerx_test/src/models/pharmacy.dart';

import '../../models/order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderState()) {
    on<LoadOrder>(_onLoad);
    on<AddMedicationToOrder>(_onAddMedication);
  }

  Future<void> _onLoad(
    LoadOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(status: OrderStatus.loading));
    emit(state.copyWith(
      status: OrderStatus.loaded,
      pharmacy: event.pharmacy,
      order: Order(
        orderId: '123',
        pharmacyId: event.pharmacy.pharmacyId,
        medications: const [],
      ),
    ));
  }

  Future<void> _onAddMedication(
    AddMedicationToOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(status: OrderStatus.loading));
    final List<String> list = [];
    for (var m in state.order!.medications) {
      list.add(m);
    }
    list.add(event.medication);

    emit(state.copyWith(
      status: OrderStatus.loaded,
      order: state.order!.copyWith(
        medications: list,
      ),
    ));
  }
}

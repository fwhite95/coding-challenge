import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimblerx_test/src/repositories/pharmacy_repository.dart';

import '../../models/order.dart';
import '../../models/pharmacy.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required PharmacyRepository pharmacyRepository,
  })  : _pharmacyRepository = pharmacyRepository,
        super(const HomeState()) {
    on<HomeLoadEvent>(_onLoadEvent);
    on<AddOrderHome>(_onAddOrderHome);
  }
  final PharmacyRepository _pharmacyRepository;

  Future<void> _onLoadEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final pharmacies = await _pharmacyRepository.getPharmaciesWithDetails();

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          pharmacies: pharmacies,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _onAddOrderHome(
    AddOrderHome event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      List<Order> list = [];
      for (var order in state.orders) {
        list.add(order);
      }
      list.add(event.order);
      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          orders: list,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}

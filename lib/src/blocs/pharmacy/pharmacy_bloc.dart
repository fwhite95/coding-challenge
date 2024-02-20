import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimblerx_test/src/models/order.dart';
import 'package:nimblerx_test/src/repositories/pharmacy_repository.dart';

import '../../models/pharmacy_detail.dart';

part 'pharmacy_event.dart';
part 'pharmacy_state.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  final PharmacyRepository _pharmacyRepository;

  PharmacyBloc({
    required PharmacyRepository pharmacyRepository,
  })  : _pharmacyRepository = pharmacyRepository,
        super(const PharmacyState()) {
    on<PharmacyLoadEvent>(_onLoadEvent);
  }

  Future<void> _onLoadEvent(
    PharmacyLoadEvent event,
    Emitter<PharmacyState> emit,
  ) async {
    emit(state.copyWith(status: PharmacyStatus.loading));
    try {
      final pharmacy =
          await _pharmacyRepository.getPharmacyById(event.pharmacyId);

      emit(
        state.copyWith(
          status: PharmacyStatus.loaded,
          pharmacy: pharmacy,
          pharmacyName: event.pharmacyName,
          pharmacyOrders: event.orders,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: PharmacyStatus.error));
    }
  }
}

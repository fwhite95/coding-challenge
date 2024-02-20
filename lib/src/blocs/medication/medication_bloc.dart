import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimblerx_test/src/repositories/medication_repository.dart';

import '../../models/order.dart';

part 'medication_event.dart';
part 'medication_state.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  MedicationBloc({
    required MedicationRepository medicationRepository,
  })  : _medicationRepository = medicationRepository,
        super(const MedicationState()) {
    on<MedicationLoadEvent>(_onLoadEvent);
  }
  final MedicationRepository _medicationRepository;

  Future<void> _onLoadEvent(
    MedicationLoadEvent event,
    Emitter<MedicationState> emit,
  ) async {
    emit(state.copyWith(status: MedicationStatus.loading));
    try {
      final medications = await _medicationRepository.getMedications();

      emit(
        state.copyWith(
          status: MedicationStatus.loaded,
          medications: medications,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: MedicationStatus.error));
    }
  }
}

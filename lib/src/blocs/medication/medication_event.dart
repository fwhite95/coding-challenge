part of 'medication_bloc.dart';

abstract class MedicationEvent extends Equatable {
  const MedicationEvent();

  @override
  List<Object?> get props => [];
}

class MedicationLoadEvent extends MedicationEvent {
  const MedicationLoadEvent();

  @override
  List<Object?> get props => [];
}

part of 'medication_bloc.dart';

enum MedicationStatus {
  initial,
  loading,
  loaded,
  error,
}

class MedicationState extends Equatable {
  const MedicationState({
    this.status = MedicationStatus.initial,
    this.medications = const [],
  });

  final MedicationStatus status;
  final List<String> medications;

  MedicationState copyWith({
    MedicationStatus? status,
    List<String>? medications,
    Order? order,
  }) {
    return MedicationState(
      status: status ?? this.status,
      medications: medications ?? this.medications,
    );
  }

  @override
  List<Object?> get props => [
        status,
        medications,
      ];
}

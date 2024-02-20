part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class LoadOrder extends OrderEvent {
  final Pharmacy pharmacy;

  const LoadOrder(this.pharmacy);

  @override
  List<Object?> get props => [
        pharmacy,
      ];
}

// AddMeicationToOrder
class AddMedicationToOrder extends OrderEvent {
  final String medication;

  const AddMedicationToOrder(this.medication);

  @override
  List<Object?> get props => [
        medication,
      ];
}

// RemoveMedicaitonFromOrder
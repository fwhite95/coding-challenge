part of 'pharmacy_bloc.dart';

abstract class PharmacyEvent extends Equatable {
  const PharmacyEvent();

  @override
  List<Object> get props => [];
}

class PharmacyLoadEvent extends PharmacyEvent {
  const PharmacyLoadEvent(this.pharmacyId, this.pharmacyName, this.orders);

  final String pharmacyId;
  final String pharmacyName;
  final List<Order> orders;

  @override
  List<Object> get props => [
        pharmacyId,
        pharmacyName,
        orders,
      ];
}

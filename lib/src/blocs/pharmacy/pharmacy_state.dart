part of 'pharmacy_bloc.dart';

enum PharmacyStatus { initial, loading, loaded, error }

class PharmacyState extends Equatable {
  final PharmacyStatus status;
  final PharmacyDetail? pharmacy;
  final List<Order> pharmacyOrders;
  final String pharmacyName;

  const PharmacyState({
    this.status = PharmacyStatus.initial,
    this.pharmacy,
    this.pharmacyOrders = const [],
    this.pharmacyName = '',
  });

  PharmacyState copyWith({
    PharmacyStatus? status,
    PharmacyDetail? pharmacy,
    List<Order>? pharmacyOrders,
    String? pharmacyName,
  }) {
    return PharmacyState(
      status: status ?? this.status,
      pharmacy: pharmacy ?? this.pharmacy,
      pharmacyOrders: pharmacyOrders ?? this.pharmacyOrders,
      pharmacyName: pharmacyName ?? this.pharmacyName,
    );
  }

  @override
  List<Object> get props => [
        status,
        pharmacyOrders,
        pharmacyName,
      ];
}

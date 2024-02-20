part of 'order_bloc.dart';

enum OrderStatus {
  initial,
  loading,
  loaded,
  error,
}

class OrderState extends Equatable {
  const OrderState({
    this.status = OrderStatus.initial,
    this.pharmacy,
    this.order,
  });

  final OrderStatus status;
  final Pharmacy? pharmacy;
  final Order? order;

  OrderState copyWith({
    OrderStatus? status,
    Pharmacy? pharmacy,
    Order? order,
  }) {
    return OrderState(
      status: status ?? this.status,
      pharmacy: pharmacy ?? this.pharmacy,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [
        status,
        pharmacy,
        order,
      ];
}

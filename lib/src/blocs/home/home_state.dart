part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.pharmacies = const [],
    this.orders = const [],
  });

  final HomeStatus status;
  final List<Pharmacy> pharmacies;
  final List<Order> orders;

  HomeState copyWith({
    HomeStatus? status,
    List<Pharmacy>? pharmacies,
    List<Order>? orders,
  }) {
    return HomeState(
      status: status ?? this.status,
      pharmacies: pharmacies ?? this.pharmacies,
      orders: orders ?? this.orders,
    );
  }

  @override
  List<Object> get props => [
        status,
        pharmacies,
        orders,
      ];
}

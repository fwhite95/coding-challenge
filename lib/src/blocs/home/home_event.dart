part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeLoadEvent extends HomeEvent {
  const HomeLoadEvent();
}

class AddOrderHome extends HomeEvent {
  const AddOrderHome(this.order);

  final Order order;

  @override
  List<Object?> get props => [
        order,
      ];
}

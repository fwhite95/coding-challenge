import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String orderId;
  final String pharmacyId;
  final List<String> medications;

  const Order({
    required this.orderId,
    required this.pharmacyId,
    required this.medications,
  });

  Order copyWith({
    String? orderId,
    String? pharmacyId,
    List<String>? medications,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      medications: medications ?? this.medications,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'] ?? '',
      pharmacyId: json['pharmacyId'] ?? '',
      medications: json['medications'] != null
          ? json['medications'].map<String>((i) => i.toString()).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'pharmacyId': pharmacyId,
      'medications': medications,
    };
  }

  @override
  List<Object?> get props => [
        orderId,
        pharmacyId,
        medications,
      ];
}

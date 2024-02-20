import 'package:equatable/equatable.dart';
import 'package:nimblerx_test/src/models/pharmacy_detail.dart';

class Pharmacy extends Equatable {
  final String name;
  final String pharmacyId;
  final PharmacyDetail? pharmacyDetail;

  const Pharmacy({
    required this.name,
    required this.pharmacyId,
    this.pharmacyDetail,
  });

  Pharmacy copyWith({
    String? name,
    String? pharmacyId,
    PharmacyDetail? pharmacyDetail,
  }) {
    return Pharmacy(
      name: name ?? this.name,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      pharmacyDetail: pharmacyDetail ?? this.pharmacyDetail,
    );
  }

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      name: json['name'],
      pharmacyId: json['pharmacyId'],
      pharmacyDetail: PharmacyDetail.fromJson(json['pharmacyDetail'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pharmacyId': pharmacyId,
      'pharmacyDetail': pharmacyDetail,
    };
  }

  @override
  List<Object?> get props => [
        name,
        pharmacyId,
        pharmacyDetail,
      ];

  static List<Map<String, dynamic>> sampleData = [
    const Pharmacy(
      name: 'ReCept',
      pharmacyId: 'NRxPh-HLRS',
    ).toJson(),
    const Pharmacy(
      name: 'My Community Pharmacy',
      pharmacyId: 'NRxPh-BAC1',
    ).toJson(),
    const Pharmacy(
      name: 'MedTime Pharmacy',
      pharmacyId: 'NRxPh-SJC1',
    ).toJson(),
    const Pharmacy(
      name: 'NY Pharmacy',
      pharmacyId: 'NRxPh-ZEREiaYq',
    ).toJson(),
  ];
}

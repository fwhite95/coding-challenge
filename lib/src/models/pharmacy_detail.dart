import 'package:equatable/equatable.dart';

import 'value.dart';

class PharmacyDetail extends Equatable {
  final String details;
  final String generatedTs;
  final String href;
  final String responseCode;
  final Value value;

  const PharmacyDetail({
    required this.details,
    required this.generatedTs,
    required this.href,
    required this.responseCode,
    required this.value,
  });

  PharmacyDetail copyWith({
    String? details,
    String? generatedTs,
    String? href,
    String? responseCode,
    Value? value,
  }) {
    return PharmacyDetail(
      details: details ?? this.details,
      generatedTs: generatedTs ?? this.generatedTs,
      href: href ?? this.href,
      responseCode: responseCode ?? this.responseCode,
      value: value ?? this.value,
    );
  }

  factory PharmacyDetail.fromJson(Map<String, dynamic> json) {
    return PharmacyDetail(
      details: json['details'] ?? '',
      generatedTs: json['generatedTs'] ?? '',
      href: json['href'] ?? '',
      responseCode: json['responseCode'] ?? '',
      value: Value.fromJson(json['value'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details,
      'generatedTs': generatedTs,
      'href': href,
      'responseCode': responseCode,
      'value': value.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        details,
        generatedTs,
        href,
        responseCode,
        value,
      ];
}

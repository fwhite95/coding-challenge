import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String addressType;
  final String city;
  final String externalId;
  final String googlePlaceId;
  final bool isValid;
  final double latitude;
  final double longitude;
  final String postalCode;
  final String streetAddress1;
  final String usTerritory;

  const Address({
    required this.addressType,
    required this.city,
    required this.externalId,
    required this.googlePlaceId,
    required this.isValid,
    required this.latitude,
    required this.longitude,
    required this.postalCode,
    required this.streetAddress1,
    required this.usTerritory,
  });

  Address copyWith({
    String? addressType,
    String? city,
    String? externalId,
    String? googlePlaceId,
    bool? isValid,
    double? latitude,
    double? longitude,
    String? postalCode,
    String? streetAddress1,
    String? usTerritory,
  }) {
    return Address(
      addressType: addressType ?? this.addressType,
      city: city ?? this.city,
      externalId: externalId ?? this.externalId,
      googlePlaceId: googlePlaceId ?? this.googlePlaceId,
      isValid: isValid ?? this.isValid,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      postalCode: postalCode ?? this.postalCode,
      streetAddress1: streetAddress1 ?? this.streetAddress1,
      usTerritory: usTerritory ?? this.usTerritory,
    );
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressType: json['addressType'] ?? '',
      city: json['city'] ?? '',
      externalId: json['externalId'] ?? '',
      googlePlaceId: json['googlePlaceId'] ?? '',
      isValid: json['isValid'] ?? false,
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      postalCode: json['postalCode'] ?? '',
      streetAddress1: json['streetAddress1'] ?? '',
      usTerritory: json['usTerritory'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressType': addressType,
      'city': city,
      'externalId': externalId,
      'googlePlaceId': googlePlaceId,
      'isValid': isValid,
      'latitude': latitude,
      'longitude': longitude,
      'postalCode': postalCode,
      'streetAddress1': streetAddress1,
      'usTerritory': usTerritory,
    };
  }

  @override
  List<Object?> get props => [
        addressType,
        city,
        externalId,
        googlePlaceId,
        isValid,
        latitude,
        longitude,
        postalCode,
        streetAddress1,
        usTerritory,
      ];
}

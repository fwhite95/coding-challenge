import 'package:equatable/equatable.dart';

import 'address.dart';

class Value extends Equatable {
  final bool acceptInvalidAddress;
  final bool active;
  final Address address;
  final bool checkoutPharmacy;
  final String defaultTimeZone;
  final List<String> deliverableStates;
  final String deliverySubsidyAmount;
  final String id;
  final bool importActive;
  final String localId;
  final bool marketplacePharmacy;
  final String name;
  final String pharmacistInCharge;
  final String pharmacyChainId;
  final String pharmacyHours;
  final String pharmacyLoginCode;
  final String pharmacySystem;
  final String pharmacyType;
  final String postalCodes;
  final String primaryPhoneNumber;
  final bool testPharmacy;

  const Value({
    required this.acceptInvalidAddress,
    required this.active,
    required this.address,
    required this.checkoutPharmacy,
    required this.defaultTimeZone,
    required this.deliverableStates,
    required this.deliverySubsidyAmount,
    required this.id,
    required this.importActive,
    required this.localId,
    required this.marketplacePharmacy,
    required this.name,
    required this.pharmacistInCharge,
    required this.pharmacyChainId,
    required this.pharmacyHours,
    required this.pharmacyLoginCode,
    required this.pharmacySystem,
    required this.pharmacyType,
    required this.postalCodes,
    required this.primaryPhoneNumber,
    required this.testPharmacy,
  });

  Value copyWith({
    bool? acceptInvalidAddress,
    bool? active,
    Address? address,
    bool? checkoutPharmacy,
    String? defaultTimeZone,
    List<String>? deliverableStates,
    String? deliverySubsidyAmount,
    String? id,
    bool? importActive,
    String? localId,
    bool? marketplacePharmacy,
    String? name,
    String? pharmacistInCharge,
    String? pharmacyChainId,
    String? pharmacyHours,
    String? pharmacyLoginCode,
    String? pharmacySystem,
    String? pharmacyType,
    String? postalCodes,
    String? primaryPhoneNumber,
    bool? testPharmacy,
  }) {
    return Value(
      acceptInvalidAddress: acceptInvalidAddress ?? this.acceptInvalidAddress,
      active: active ?? this.active,
      address: address ?? this.address,
      checkoutPharmacy: checkoutPharmacy ?? this.checkoutPharmacy,
      defaultTimeZone: defaultTimeZone ?? this.defaultTimeZone,
      deliverableStates: deliverableStates ?? this.deliverableStates,
      deliverySubsidyAmount:
          deliverySubsidyAmount ?? this.deliverySubsidyAmount,
      id: id ?? this.id,
      importActive: importActive ?? this.importActive,
      localId: localId ?? this.localId,
      marketplacePharmacy: marketplacePharmacy ?? this.marketplacePharmacy,
      name: name ?? this.name,
      pharmacistInCharge: pharmacistInCharge ?? this.pharmacistInCharge,
      pharmacyChainId: pharmacyChainId ?? this.pharmacyChainId,
      pharmacyHours: pharmacyHours ?? this.pharmacyHours,
      pharmacyLoginCode: pharmacyLoginCode ?? this.pharmacyLoginCode,
      pharmacySystem: pharmacySystem ?? this.pharmacySystem,
      pharmacyType: pharmacyType ?? this.pharmacyType,
      postalCodes: postalCodes ?? this.postalCodes,
      primaryPhoneNumber: primaryPhoneNumber ?? this.primaryPhoneNumber,
      testPharmacy: testPharmacy ?? this.testPharmacy,
    );
  }

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      acceptInvalidAddress: json['acceptInvalidAddress'] ?? false,
      active: json['active'] ?? false,
      address: Address.fromJson(json['address'] ?? {}),
      checkoutPharmacy: json['checkoutPharmacy'] ?? false,
      defaultTimeZone: json['defaultTimeZone'] ?? '',
      deliverableStates: json['deliverableStates']  != null
          ? json['deliverableStates'].map<String>((i) => i.toString()).toList()
          : [],
      deliverySubsidyAmount: json['deliverySubsidyAmount'] ?? '',
      id: json['id'] ?? '',
      importActive: json['importActive'] ?? false,
      localId: json['localId'] ?? '',
      marketplacePharmacy: json['marketplacePharmacy'] ?? false,
      name: json['name'] ?? '',
      pharmacistInCharge: json['pharmacistInCharge'] ?? '',
      pharmacyChainId: json['pharmacyChainId'] ?? '',
      pharmacyHours: json['pharmacyHours'] ?? '',
      pharmacyLoginCode: json['pharmacyLoginCode'] ?? '',
      pharmacySystem: json['pharmacySystem'] ?? '',
      pharmacyType: json['pharmacyType'] ?? '',
      postalCodes: json['postalCodes'] ?? '',
      primaryPhoneNumber: json['primaryPhoneNumber'] ?? '',
      testPharmacy: json['testPharmacy'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'acceptInvalidAddress': acceptInvalidAddress,
      'active': active,
      'address': address.toJson(),
      'checkoutPharmacy': checkoutPharmacy,
      'defaultTimeZone': defaultTimeZone,
      'deliverableStates': deliverableStates,
      'deliverySubsidyAmount': deliverySubsidyAmount,
      'id': id,
      'importActive': importActive,
      'localId': localId,
      'marketplacePharmacy': marketplacePharmacy,
      'name': name,
      'pharmacistInCharge': pharmacistInCharge,
      'pharmacyChainId': pharmacyChainId,
      'pharmacyHours': pharmacyHours,
      'pharmacyLoginCode': pharmacyLoginCode,
      'pharmacySystem': pharmacySystem,
      'pharmacyType': pharmacyType,
      'postalCodes': postalCodes,
      'primaryPhoneNumber': primaryPhoneNumber,
      'testPharmacy': testPharmacy,
    };
  }

  @override
  List<Object?> get props => [
        acceptInvalidAddress,
        active,
        address,
        checkoutPharmacy,
        defaultTimeZone,
        deliverableStates,
        deliverySubsidyAmount,
        id,
        importActive,
        localId,
        marketplacePharmacy,
        name,
        pharmacistInCharge,
        pharmacyChainId,
        pharmacyHours,
        pharmacyLoginCode,
        pharmacySystem,
        pharmacyType,
        postalCodes,
        primaryPhoneNumber,
        testPharmacy,
      ];
}

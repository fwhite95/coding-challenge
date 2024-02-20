import 'package:flutter/material.dart';
import 'package:nimblerx_test/src/repositories/medication_repository.dart';
import 'package:nimblerx_test/src/repositories/pharmacy_repository.dart';
import 'package:nimblerx_test/src/services/api_client.dart';

import 'src/app.dart';

void main() {
  final apiClient = ApiClient();
  final pharmacyRepository = PharmacyRepository(apiClient: apiClient);
  final medicationRepository = MedicationRepository(apiClient: apiClient);

  runApp(MyApp(
    pharmacyRepository: pharmacyRepository,
    medicationRepository: medicationRepository,
  ));
}

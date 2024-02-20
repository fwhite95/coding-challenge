import '../services/api_client.dart';

class MedicationRepository {
  final ApiClient apiClient;

  MedicationRepository({required this.apiClient});

  Future<List<String>> getMedications() async {
    final response = apiClient.getMedications();
    return response;
  }
}

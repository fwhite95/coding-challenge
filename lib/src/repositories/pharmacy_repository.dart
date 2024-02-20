import 'package:nimblerx_test/src/models/pharmacy.dart';
import 'package:nimblerx_test/src/models/pharmacy_detail.dart';
import 'package:nimblerx_test/src/services/api_client.dart';

class PharmacyRepository {
  final ApiClient apiClient;

  PharmacyRepository({required this.apiClient});

  Future<List<Pharmacy>> getPharmaciesWithDetails() async {
    try {
      List<Pharmacy> list = [];
      final response = await apiClient.getPharmacyList();

      List<Pharmacy> pharmacyList = response['pharmacies'] != null
          ? response['pharmacies'].map<Pharmacy>((p) {
              return Pharmacy.fromJson(p);
            }).toList()
          : [];

      for (int i = 0; i < pharmacyList.length; i++) {
        final details = await apiClient.getPharmacy(pharmacyList[i].pharmacyId);
        final pd = PharmacyDetail.fromJson(details);

        list.add(
          pharmacyList[i].copyWith(
            pharmacyDetail: pd,
          ),
        );
      }

      return Future.value(list);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Pharmacy>> getPharmacies() async {
    try {
      final response = await apiClient.getPharmacyList();

      if (response['pharmacies'] != null) {
        return response['pharmacies'].map<Pharmacy>((p) {
          return Pharmacy.fromJson(p);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<PharmacyDetail> getPharmacyById(String pharmacyId) async {
    try {
      final response = await apiClient.getPharmacy(pharmacyId);
      return PharmacyDetail.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}

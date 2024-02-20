import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimblerx_test/src/models/pharmacy.dart';

class ApiClient {
  ApiClient({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  // GET
  Future<Map<String, dynamic>> getPharmacyList() async {
    return Future.value({'pharmacies': Pharmacy.sampleData});
  }

  // GET /pharmacies/info/{pharmacyId}
  Future<Map<String, dynamic>> getPharmacy(String pharmacyId) async {
    final uri = Uri.parse(
        'https://api-qa-demo.nimbleandsimple.com/pharmacies/info/$pharmacyId');
    try {
      final response = await _httpClient.get(uri);
      final body = jsonDecode(response.body);

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('${response.statusCode}, error: ${body['message']}');
      }

      return body;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // GET /prod/medicationListFromNIH/medicationListFromNIH.txt
  Future<List<String>> getMedications() async {
    final uri = Uri.parse(
        'https://s3-us-west-2.amazonaws.com/assets.nimblerx.com/prod/medicationListFromNIH/medicationListFromNIH.txt');
    try {
      final response = await _httpClient.get(uri);
      final list = response.body.split(',');
      

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('${response.statusCode}, error: $response');
      }

      return list;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

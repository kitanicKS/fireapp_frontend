import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fire_app/model/lagerort_model.dart';
import 'package:logging/logging.dart';
import 'package:fire_app/logging_setup.dart';

class ApiServiceLagerort {
  final String baseUrl;
  final String username;
  final String password;
  final http.Client client;
  final Logger _logger = Logger('ApiServiceLagerort');

  // Constructor takes the base URL, Basic Auth credentials, and an http.Client
  ApiServiceLagerort(this.baseUrl, this.username, this.password, this.client) {
    setupLogging();
  }

  // Method to encode the Basic Auth credentials and generate the Authorization header
  String _getAuthHeader() {
    String credentials = '$username:$password';
    String base64Credentials = base64Encode(utf8.encode(credentials));
    return 'Basic $base64Credentials';
  }

  // GET request: Fetch lagerort data
  Future<List<Lagerort>> fetchLagerort() async {
    final response = await client.get(
      Uri.parse('$baseUrl/lagerort'),
      headers: {
        'Authorization': _getAuthHeader(),
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
       _logger.info('Fetched lagerort: ${response.statusCode} ${response.body}');
      return data.map((json) => Lagerort.fromJson(json)).toList();
    } else {
      _logger.severe('Failed to fetch lagerort: ${response.statusCode} ${response.body}');
      throw Exception('Failed to fetch lagerort');
    }
  }

  // POST request: Create a new lagerort
  Future<Lagerort> createLagerort(Lagerort lagerort) async {
    final response = await client.post(
      Uri.parse('$baseUrl/lagerort'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _getAuthHeader(),
      },
      body: json.encode(lagerort.toJson()),
    );

    if (response.statusCode == 201) {
      _logger.info('Fetched lagerort: ${response.statusCode} ${response.body}');
      return Lagerort.fromJson(json.decode(response.body));
    } else {
      _logger.severe('Failed to create lagerartikel: ${response.statusCode} ${response.body}');
      throw Exception('Failed to create lagerort');
    }
  }

  // PUT request: Update a lagerort
  Future<Lagerort> updateLagerort(Lagerort lagerort) async {
    final response = await client.put(
      Uri.parse('$baseUrl/lagerort/${lagerort.id}'),  // Lagerort ID is passed in the URL
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _getAuthHeader(),
      },
      body: json.encode(lagerort.toJson()),
    );

    if (response.statusCode == 200) {
      _logger.info('Fetched lagerort: ${response.statusCode} ${response.body}');
      return Lagerort.fromJson(json.decode(response.body));
    } else {
      _logger.severe('Failed to update lagerort: ${response.statusCode} ${response.body}');
      throw Exception('Failed to update lagerort');
    }
  }

  // DELETE request: Delete a lagerort
  Future<void> deleteLagerort(int lagerortId) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/lagerort/$lagerortId'), // Lagerort ID is passed in the URL
      headers: {
        'Authorization': _getAuthHeader(),
      },
    );

    if (response.statusCode != 200) {
      _logger.severe('Failed to delete lagerort: ${response.statusCode} ${response.body}');
      throw Exception('Failed to delete lagerort');
    } else {
      _logger.info('DELETE lagerort: ${response.statusCode} ${response.body}');
    }
  }
}
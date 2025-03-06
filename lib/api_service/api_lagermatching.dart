import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fire_app/model/lagermatching_model.dart';
import 'package:logging/logging.dart';
import 'package:fire_app/logging_setup.dart';

class ApiServiceLagermatching {
  final String baseUrl;
  final String username;
  final String password;
  final http.Client client;
  final Logger _logger = Logger('ApiServiceLagermatching');

  // Constructor takes the base URL, Basic Auth credentials, and an http.Client
  ApiServiceLagermatching(this.baseUrl, this.username, this.password, this.client) {
    setupLogging();
  }

  // Method to encode the Basic Auth credentials and generate the Authorization header
  String _getAuthHeader() {
    String credentials = '$username:$password';
    String base64Credentials = base64Encode(utf8.encode(credentials));
    return 'Basic $base64Credentials';
  }

  // GET request: Fetch lagermatching data
  Future<List<Lagermatching>> fetchLagermatching() async {
    final response = await client.get(
      Uri.parse('$baseUrl/lagermatching'),
      headers: {
        'Authorization': _getAuthHeader(),
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
     _logger.info('Fetched lagermatching: ${response.statusCode} ${response.body}');
      return data.map((json) => Lagermatching.fromJson(json)).toList();
    } else {
      _logger.severe('Failed to fetch lagermatching: ${response.statusCode} ${response.body}');
      throw Exception('Failed to fetch lagermatching');
    }
  }

  // POST request: Create a new lagermatching
  Future<Lagermatching> createLagermatching(Lagermatching lagermatching) async {
    final response = await client.post(
      Uri.parse('$baseUrl/lagermatching'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _getAuthHeader(),
      },
      body: json.encode(lagermatching.toJson()),
    );

    if (response.statusCode == 201) {
      _logger.info('Create lagermatching: ${response.statusCode} ${response.body}');
      return Lagermatching.fromJson(json.decode(response.body));
    } else {
      _logger.severe('Failed to create lagermatching: ${response.statusCode} ${response.body}');
      throw Exception('Failed to create lagermatching');
    }
  }

  // PUT request: Update a lagermatching
  Future<Lagermatching> updateLagermatching(Lagermatching lagermatching) async {
    final response = await client.put(
      Uri.parse('$baseUrl/lagermatching/${lagermatching.id}'),  // Lagermatching ID is passed in the URL
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _getAuthHeader(),
      },
      body: json.encode(lagermatching.toJson()),
    );

    if (response.statusCode == 200) {
      _logger.info('Update lagermatching: ${response.statusCode} ${response.body}');
      return Lagermatching.fromJson(json.decode(response.body));
    } else {
     _logger.severe('Failed to update lagermatching: ${response.statusCode} ${response.body}');
      throw Exception('Failed to update lagermatching');
    }
  }

  // DELETE request: Delete a lagermatching
  Future<void> deleteLagermatching(int lagermatchingId) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/lagermatching/$lagermatchingId'), // Lagermatching ID is passed in the URL
      headers: {
        'Authorization': _getAuthHeader(),
      },
    );

    if (response.statusCode != 200) {
     _logger.severe('Failed to delete lagermatching: ${response.statusCode} ${response.body}');
      throw Exception('Failed to delete lagermatching');
    } else {
      _logger.info('Delete lagermatching: ${response.statusCode} ${response.body}');
    }
  }
}
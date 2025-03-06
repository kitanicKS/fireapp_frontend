import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fire_app/model/lagerort_model.dart';

class ApiServiceLagerort {
  final String baseUrl;
  final String username;
  final String password;
  final http.Client client;

  // Constructor takes the base URL, Basic Auth credentials, and an http.Client
  ApiServiceLagerort(this.baseUrl, this.username, this.password, this.client);

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
      return data.map((json) => Lagerort.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load lagerort');
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
      return Lagerort.fromJson(json.decode(response.body));
    } else {
      print('Failed to create lagerort: ${response.statusCode} ${response.body}');
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
      return Lagerort.fromJson(json.decode(response.body));
    } else {
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
      throw Exception('Failed to delete lagerort');
    }
  }
}
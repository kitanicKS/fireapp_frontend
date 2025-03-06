import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fire_app/model/lagermatching_model.dart';


class ApiServiceLagermatching {
  final String baseUrl;
  final String username;
  final String password;
  final http.Client client;

  // Constructor takes the base URL, Basic Auth credentials, and an http.Client
  ApiServiceLagermatching(this.baseUrl, this.username, this.password, this.client);

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
      return data.map((json) => Lagermatching.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load lagermatching');
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
      return Lagermatching.fromJson(json.decode(response.body));
    } else {
      print('Failed to create lagermatching: ${response.statusCode} ${response.body}');
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
      return Lagermatching.fromJson(json.decode(response.body));
    } else {
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
      throw Exception('Failed to delete lagermatching');
    }
  }
}
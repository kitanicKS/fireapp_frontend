import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fire_app/model/lagerartikel_model.dart';

class ApiService {
  final String baseUrl;
  final String username;
  final String password;
  final http.Client client;

  // Konstruktor nimmt die Basis-URL sowie die Basic Auth-Zugangsdaten entgegen
  ApiService(this.baseUrl, this.username, this.password, this.client);

  // Methode, um die Basic Auth-Zugangsdaten zu codieren und den Authorization-Header zu erzeugen
  String _getAuthHeader() {
    String credentials = '$username:$password';
    String base64Credentials = base64Encode(utf8.encode(credentials));
    return 'Basic $base64Credentials';
  }

  // GET request: Fetch lagerartikel data
  Future<List<Lagerartikel>> fetchLagerartikel() async {
    final response = await client.get(
      Uri.parse('$baseUrl/lagerartikel'),
      headers: {
        'Authorization': _getAuthHeader(),
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Lagerartikel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load lagerartikel');
    }
  }

  // POST request: Create a new lagerartikel
  Future<Lagerartikel> createLagerartikel(Lagerartikel lagerartikel) async {
    final response = await client.post(
      Uri.parse('$baseUrl/lagerartikel'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _getAuthHeader(),
      },
      body: json.encode(lagerartikel.toJson()),
    );

    if (response.statusCode == 201) {
      return Lagerartikel.fromJson(json.decode(response.body));
    } else {
      print('Failed to create lagerartikel: ${response.statusCode} ${response.body}');
      throw Exception('Failed to create lagerartikel');
    }
  }

  // PUT request: Update a lagerartikel
  Future<Lagerartikel> updateLagerartikel(Lagerartikel lagerartikel) async {
    final response = await client.put(
      Uri.parse('$baseUrl/lagerartikel/${lagerartikel.id}'),  // Lagerartikel ID is passed in the URL
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _getAuthHeader(),
      },
      body: json.encode(lagerartikel.toJson()),
    );

    if (response.statusCode == 200) {
      return Lagerartikel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update lagerartikel');
    }
  }

  // DELETE request: Delete a lagerartikel
  Future<void> deleteLagerartikel(int lagerartikelId) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/lagerartikel/$lagerartikelId'), // Lagerartikel ID is passed in the URL
      headers: {
        'Authorization': _getAuthHeader(),
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete lagerartikel');
    }
  }
}
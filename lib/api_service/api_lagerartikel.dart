import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fire_app/model/lagerartikel_model.dart';
import 'package:logging/logging.dart';
import 'package:fire_app/logging_setup.dart';

const String apiurllagerartikel = 'http://h3003963.stratoserver.net';
const String apiurllagermatching =
    'http://h3003963.stratoserver.net/lagermatching';
const String apiusername = 'some_cool_user';
const String apipassword = '!!1234fireappppaerif4321!!';

class ApiServiceLagerartikel {
  final String baseUrl;
  final String username;
  final String password;
  final http.Client client;
  final Logger _logger = Logger('ApiServiceLagerartikel');

  // Konstruktor nimmt die Basis-URL sowie die Basic Auth-Zugangsdaten entgegen
  ApiServiceLagerartikel(
      this.baseUrl, this.username, this.password, this.client) {
    setupLogging();
  }

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
      _logger.info(
          'Fetched lagerartikel: ${response.statusCode} ${response.body}');
      return data.map((json) => Lagerartikel.fromJson(json)).toList();
    } else {
      _logger.severe(
          'Failed to fetch lagerartikel: ${response.statusCode} ${response.body}');
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
      _logger
          .info('CREATE lagerartikel: ${response.statusCode} ${response.body}');
      return Lagerartikel.fromJson(json.decode(response.body));
    } else {
      _logger.severe(
          'Failed to create lagerartikel: ${response.statusCode} ${response.body}');
      throw Exception('Failed to create lagerartikel');
    }
  }

  // PUT request: Update a lagerartikel
  Future<Lagerartikel> updateLagerartikel(Lagerartikel lagerartikel) async {
    final response = await client.put(
      Uri.parse(
          '$baseUrl/lagerartikel/${lagerartikel.id}'), // Lagerartikel ID is passed in the URL
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _getAuthHeader(),
      },
      body: json.encode(lagerartikel.toJson()),
    );

    if (response.statusCode == 200) {
      _logger
          .info('UPDATE lagerartikel: ${response.statusCode} ${response.body}');
      return Lagerartikel.fromJson(json.decode(response.body));
    } else {
      _logger.severe(
          'Failed to update lagerartikel: ${response.statusCode} ${response.body}');
      throw Exception('Failed to update lagerartikel');
    }
  }

  // DELETE request: Delete a lagerartikel
  Future<void> deleteLagerartikel(int lagerartikelId) async {
    final response = await client.delete(
      Uri.parse(
          '$baseUrl/lagerartikel/$lagerartikelId'), // Lagerartikel ID is passed in the URL
      headers: {
        'Authorization': _getAuthHeader(),
      },
    );

    if (response.statusCode != 200) {
      _logger.severe(
          'Failed to delete lagerartikel: ${response.statusCode} ${response.body}');
      throw Exception('Failed to delete lagerartikel');
    } else {
      _logger
          .info('DELETE lagerartikel: ${response.statusCode} ${response.body}');
    }
  }
}

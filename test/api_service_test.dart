// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:fire_app/model/lagerartikel_model.dart';
import 'package:fire_app/model/lagerort_model.dart';
import 'package:fire_app/model/lagermatching_model.dart';
import 'package:fire_app/api_service/api_lagerartikel.dart';
import 'package:fire_app/api_service/api_lagerort.dart';
import 'package:fire_app/api_service/api_lagermatching.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

void main() {

group('ApiService', () {
    final mockClient = MockClient((request) async {
      if (request.method == 'GET' && request.url.path == '/lagerartikel') {
        return http.Response(jsonEncode([
          {
            'la_id': 1,
            'la_name': 'Grillzange',
            'la_anzahl': 10,
            'la_pic': 'somepic',
            'la_description': 'Zange zum Grillen'
          }
        ]), 200);
      } else if (request.method == 'POST' && request.url.path == '/lagerartikel') {
        return http.Response(jsonEncode({
          'la_id': 2,
          'la_name': 'Feuerlöscher',
          'la_anzahl': 5,
          'la_pic': 'somepic2',
          'la_description': 'Feuerlöscher für Notfälle'
        }), 201);
      } else if (request.method == 'PUT' && request.url.path == '/lagerartikel/1') {
        return http.Response(jsonEncode({
          'la_id': 1,
          'la_name': 'Grillzange Updated',
          'la_anzahl': 15,
          'la_pic': 'somepic',
          'la_description': 'Zange zum Grillen Updated'
        }), 200);
      } else if (request.method == 'DELETE' && request.url.path == '/lagerartikel/1') {
        return http.Response('', 200);
      } else {
        return http.Response('Not Found', 404);
      }
    });

    final apiService = ApiServiceLagerartikel('https://api.example.com', 'yourUsername', 'yourPassword', mockClient);

    test('fetchLagerartikel returns a list of Lagerartikel', () async {
      final result = await apiService.fetchLagerartikel();
      expect(result.length, 1);
      expect(result[0].id, 1);
      expect(result[0].name, 'Grillzange');
    });

    test('createLagerartikel creates a new Lagerartikel', () async {
      final newLagerartikel = Lagerartikel(
        id: 2,
        name: 'Feuerlöscher',
        quantity: 5,
        pic: 'somepic2',
        description: 'Feuerlöscher für Notfälle',
      );
      final result = await apiService.createLagerartikel(newLagerartikel);
      expect(result.id, 2);
      expect(result.name, 'Feuerlöscher');
    });

    test('updateLagerartikel updates an existing Lagerartikel', () async {
      final updatedLagerartikel = Lagerartikel(
        id: 1,
        name: 'Grillzange Updated',
        quantity: 15,
        pic: 'somepic',
        description: 'Zange zum Grillen Updated',
      );
      final result = await apiService.updateLagerartikel(updatedLagerartikel);
      expect(result.id, 1);
      expect(result.name, 'Grillzange Updated');
    });

    test('deleteLagerartikel deletes an existing Lagerartikel', () async {
      await apiService.deleteLagerartikel(1);
      // If no exception is thrown, the test passes
    });
  });

  group('ApiService', () {
    final mockClient = MockClient((request) async {
      if (request.method == 'GET' && request.url.path == '/lagerort') {
        return http.Response(jsonEncode([
          {
            'lo_id': 3,
            'lo_name': 'Box',
            'lo_box': 'obenlinks',
            'lo_ablage': 'Hochregallager',
            'lo_raum': 'Fahrzeughalle',
            'lo_flaeche': 'FFW_Haus',
            'lo_pic': 'path/to/pic.jpg',
            'lo_description': 'Box im Hochregallager oben links'
          }
        ]), 200);
      } else if (request.method == 'POST' && request.url.path == '/lagerort') {
        return http.Response(jsonEncode({
          'lo_id': 4,
          'lo_name': 'Schrank',
          'lo_box': 'untenrechts',
          'lo_ablage': 'Lagerraum',
          'lo_raum': 'Werkstatt',
          'lo_flaeche': 'FFW_Haus',
          'lo_pic': 'path/to/pic2.jpg',
          'lo_description': 'Schrank im Lagerraum unten rechts'
        }), 201);
      } else if (request.method == 'PUT' && request.url.path == '/lagerort/3') {
        return http.Response(jsonEncode({
          'lo_id': 3,
          'lo_name': 'Box Updated',
          'lo_box': 'obenlinks',
          'lo_ablage': 'Hochregallager',
          'lo_raum': 'Fahrzeughalle',
          'lo_flaeche': 'FFW_Haus',
          'lo_pic': 'path/to/pic.jpg',
          'lo_description': 'Box im Hochregallager oben links Updated'
        }), 200);
      } else if (request.method == 'DELETE' && request.url.path == '/lagerort/3') {
        return http.Response('', 200);
      } else {
        return http.Response('Not Found', 404);
      }
    });

    final apiService = ApiServiceLagerort('https://api.example.com', 'yourUsername', 'yourPassword', mockClient);

    test('fetchLagerort returns a list of Lagerort', () async {
      final result = await apiService.fetchLagerort();
      expect(result.length, 1);
      expect(result[0].id, 3);
      expect(result[0].name, 'Box');
    });

    test('createLagerort creates a new Lagerort', () async {
      final newLagerort = Lagerort(
        id: 4,
        name: 'Schrank',
        box: 'untenrechts',
        ablage: 'Lagerraum',
        raum: 'Werkstatt',
        flaeche: 'FFW_Haus',
        pic: 'path/to/pic2.jpg',
        description: 'Schrank im Lagerraum unten rechts',
      );
      final result = await apiService.createLagerort(newLagerort);
      expect(result.id, 4);
      expect(result.name, 'Schrank');
    });

    test('updateLagerort updates an existing Lagerort', () async {
      final updatedLagerort = Lagerort(
        id: 3,
        name: 'Box Updated',
        box: 'obenlinks',
        ablage: 'Hochregallager',
        raum: 'Fahrzeughalle',
        flaeche: 'FFW_Haus',
        pic: 'path/to/pic.jpg',
        description: 'Box im Hochregallager oben links Updated',
      );
      final result = await apiService.updateLagerort(updatedLagerort);
      expect(result.id, 3);
      expect(result.name, 'Box Updated');
    });

    test('deleteLagerort deletes an existing Lagerort', () async {
      await apiService.deleteLagerort(3);
      // If no exception is thrown, the test passes
    });
  });

group('ApiService', () {
    final mockClient = MockClient((request) async {
      if (request.method == 'GET' && request.url.path == '/lagermatching') {
        return http.Response(jsonEncode([
          {
            'lm_id': 1,
            'lm_la_id': 1,
            'lm_lo_id': 3
          }
        ]), 200);
      } else if (request.method == 'POST' && request.url.path == '/lagermatching') {
        return http.Response(jsonEncode({
          'lm_id': 2,
          'lm_la_id': 2,
          'lm_lo_id': 4
        }), 201);
      } else if (request.method == 'PUT' && request.url.path == '/lagermatching/1') {
        return http.Response(jsonEncode({
          'lm_id': 1,
          'lm_la_id': 1,
          'lm_lo_id': 3
        }), 200);
      } else if (request.method == 'DELETE' && request.url.path == '/lagermatching/1') {
        return http.Response('', 200);
      } else {
        return http.Response('Not Found', 404);
      }
    });

    final apiService = ApiServiceLagermatching('https://api.example.com', 'yourUsername', 'yourPassword', mockClient);

    test('fetchLagermatching returns a list of Lagermatching', () async {
      final result = await apiService.fetchLagermatching();
      expect(result.length, 1);
      expect(result[0].id, 1);
      expect(result[0].laId, 1);
      expect(result[0].loId, 3);
    });

    test('createLagermatching creates a new Lagermatching', () async {
      final newLagermatching = Lagermatching(
        id: 2,
        laId: 2,
        loId: 4,
      );
      final result = await apiService.createLagermatching(newLagermatching);
      expect(result.id, 2);
      expect(result.laId, 2);
      expect(result.loId, 4);
    });

    test('updateLagermatching updates an existing Lagermatching', () async {
      final updatedLagermatching = Lagermatching(
        id: 1,
        laId: 1,
        loId: 3,
      );
      final result = await apiService.updateLagermatching(updatedLagermatching);
      expect(result.id, 1);
      expect(result.laId, 1);
      expect(result.loId, 3);
    });

    test('deleteLagermatching deletes an existing Lagermatching', () async {
      await apiService.deleteLagermatching(1);
      // If no exception is thrown, the test passes
    });
  });

}

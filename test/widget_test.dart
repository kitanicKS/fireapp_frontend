// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fire_app/main.dart';
import 'package:fire_app/model/lagerartikel_model.dart';
import 'package:fire_app/model/lagermatching_model.dart';
import 'package:fire_app/model/lagerort_model.dart';
import 'package:fire_app/api_service/api_lagerartikel.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

void main() {

  testWidgets('Table and text "Gegenstand" and "Anzahl" are present', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());


  final state = tester.state(find.byType(MyHomePage)) as MyHomePageState;
    // ignore: invalid_use_of_protected_member
    state.setState(() {
      state.boxSectionSelected = true;
      state.boxSelected = true;
    });

    // Rebuild the widget with the updated state.
    await tester.pump();

    // Verify that the text "Gegenstand" and "Anzahl" are present.
    expect(find.text('Gegenstand'), findsOneWidget);
    expect(find.text('Anzahl'), findsOneWidget);
  });


  testWidgets('Load Data button is present', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.add));
    //await tester.pump();

    // Verify that the "Load Data" button is present.
    expect(find.text('Load Data'), findsOneWidget);
  });

  testWidgets('Find all AssetImage elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that all AssetImage elements are present.
    expect(find.byType(Image), findsNWidgets(12)); // Adjust the number based on the actual count of Image widgets

    // Verify specific AssetImage elements by their asset paths.
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/14.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/13.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/12.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/11.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/24.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/23.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/22.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/21.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/34.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/33.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/32.jpg'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/31.jpg'), findsOneWidget);
  });

  testWidgets('Verify correct app name in AppBar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the AppBar title is 'Fire App'.
    expect(find.text('Fire App'), findsOneWidget);
  });

test('Lagerartikel model fromJson and toJson', () {
    // Sample JSON data
    final json = {
      'la_id': 1,
      'la_name': 'Grillzange',
      'la_anzahl': 10,
      'la_pic': 'somepic',
      'la_description': 'Zange zum Grillen'
    };

    // Create Lagerartikel object from JSON
    final lagerartikel = Lagerartikel.fromJson(json);

    // Verify the Lagerartikel object
    expect(lagerartikel.id, 1);
    expect(lagerartikel.name, 'Grillzange');
    expect(lagerartikel.quantity, 10);
    expect(lagerartikel.pic, 'somepic');
    expect(lagerartikel.description, 'Zange zum Grillen');

    // Convert Lagerartikel object to JSON
    final toJson = lagerartikel.toJson();

    // Verify the JSON data
    expect(toJson['la_id'], 1);
    expect(toJson['la_name'], 'Grillzange');
    expect(toJson['la_anzahl'], 10);
    expect(toJson['la_pic'], 'somepic');
    expect(toJson['la_description'], 'Zange zum Grillen');
  });

  test('Lagermatching model fromJson and toJson', () {
    // Sample JSON data
    final json = {
      'lm_id': 1,
      'lm_la_id': 1,
      'lm_lo_id': 3
    };

    // Create Lagermatching object from JSON
    final lagermatching = Lagermatching.fromJson(json);

    // Verify the Lagermatching object
    expect(lagermatching.id, 1);
    expect(lagermatching.laId, 1);
    expect(lagermatching.loId, 3);

    // Convert Lagermatching object to JSON
    final toJson = lagermatching.toJson();

    // Verify the JSON data
    expect(toJson['lm_id'], 1);
    expect(toJson['lm_la_id'], 1);
    expect(toJson['lm_lo_id'], 3);
  });
  
test('Lagerort model fromJson and toJson', () {
    // Sample JSON data
    final json = {
      'lo_id': 3,
      'lo_name': 'Box',
      'lo_box': 'obenlinks',
      'lo_ablage': 'Hochregallager',
      'lo_raum': 'Fahrzeughalle',
      'lo_flaeche': 'FFW_Haus',
      'lo_pic': 'path/to/pic.jpg',
      'lo_description': 'Box im Hochregallager oben links'
    };

    // Create Lagerort object from JSON
    final lagerort = Lagerort.fromJson(json);

    // Verify the Lagerort object
    expect(lagerort.id, 3);
    expect(lagerort.name, 'Box');
    expect(lagerort.box, 'obenlinks');
    expect(lagerort.ablage, 'Hochregallager');
    expect(lagerort.raum, 'Fahrzeughalle');
    expect(lagerort.flaeche, 'FFW_Haus');
    expect(lagerort.pic, 'path/to/pic.jpg');
    expect(lagerort.description, 'Box im Hochregallager oben links');

    // Convert Lagerort object to JSON
    final toJson = lagerort.toJson();

    // Verify the JSON data
    expect(toJson['lo_id'], 3);
    expect(toJson['lo_name'], 'Box');
    expect(toJson['lo_box'], 'obenlinks');
    expect(toJson['lo_ablage'], 'Hochregallager');
    expect(toJson['lo_raum'], 'Fahrzeughalle');
    expect(toJson['lo_flaeche'], 'FFW_Haus');
    expect(toJson['lo_pic'], 'path/to/pic.jpg');
    expect(toJson['lo_description'], 'Box im Hochregallager oben links');
  });

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

    final apiService = ApiService('https://api.example.com', 'yourUsername', 'yourPassword', mockClient);

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

}

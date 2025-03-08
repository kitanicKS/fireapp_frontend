import 'package:flutter_test/flutter_test.dart';
import 'package:fire_app/model/lagerartikel_model.dart';
import 'package:fire_app/model/lagermatching_model.dart';
import 'package:fire_app/model/lagerort_model.dart';

void main() {


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

}
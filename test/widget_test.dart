// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fire_app/main.dart';

void main() {


  testWidgets('Table and text "Gegenstand" and "Anzahl" are present', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

 // Find the image with the specific asset path.
    //final imageFinder = find.byWidgetPredicate((widget) =>
    //  widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/14.jpg');

    // Verify that the image is present.
   // expect(imageFinder, findsOneWidget);

    // Tap on the image.
   // await tester.tap(imageFinder);
   7/ await tester.pumpAndSettle();

   // Find the image with the specific asset path.
    //final imageFinder2 = find.byWidgetPredicate((widget) =>
    //  widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/hochregal/32.jpg');

    // Verify that the image is present.
    //expect(imageFinder2, findsOneWidget);

 final state = tester.state(find.byType(MyHomePage)) as MyHomePageState;
    state.setState(() {
      state.boxSectionSelected = true;
      state.boxSelected = true;
    });

    // Rebuild the widget with the updated state.
    await tester.pump();

    // Tap on the image.
    //await tester.tap(imageFinder2);
    //await tester.pumpAndSettle();

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

}

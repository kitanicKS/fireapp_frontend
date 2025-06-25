import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:logging/logging.dart';
import 'package:fire_app/logging_setup.dart';
import 'package:fire_app/model/lagerartikel_model.dart';
import 'package:fire_app/api_service/api_lagerartikel.dart';
// ignore: uri_does_not_exist
import 'constant.dart';

//final Logger _logger = Logger('MyAppLogger');

const String apiurllagerartikel = 'http://h3003963.stratoserver.net';
const String apiurllagermatching =
    'http://h3003963.stratoserver.net/lagermatching';
const String apiusername = 'some_cool_user';
const String apipassword = '!!1234fireappppaerif4321!!';

Future<void> main() async {
  setupLogging();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool boxSectionSelected = false;
  bool boxSelected = false;
  bool firstrow = false;
  int boxSectionX = 0;
  int boxSectionY = 0;
  int boxPosition = 0;
  late ApiServiceLagerartikel apiService; // neu
  late Future<List<Lagerartikel>> lagerartikelList; // neu

// ignore: undefined_identifier
  final String apiUrllagerartikel = apiurllagerartikel;
// ignore: undefined_identifier
  final String apiUrllagermatching = apiurllagermatching;
// ignore: undefined_identifier
  final String apiUsername = apiusername;
// ignore: undefined_identifier
  final String apiPassword = apipassword;

  @override
  void initState() {
    super.initState();
    apiService = ApiServiceLagerartikel(
      apiUrllagerartikel, // Replace with your API base URL
      apiUsername,
      apiPassword,
      http.Client(),
    );
    lagerartikelList = apiService.fetchLagerartikel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Fire App'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            Row(
              children: [
                for (int x = 1; x < 4; x++)
                  Expanded(
                    child: Column(
                      children: [
                        for (int y = 4; y > 0; y--)
                          InkWell(
                            onTap: () {
                              zoom(x, y);
                              setState(() {});
                            },
                            child: Ink(
                              child: Center(
                                child: Image(
                                  image:
                                      AssetImage('assets/hochregal/$x$y.jpg'),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  )
              ],
            ),
            Container(
              height: 40,
            ),
            if (boxSectionSelected && !firstrow)
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectBox(1);
                        setState(() {});
                      },
                      child: Ink(
                        child: Center(
                          child: Image(
                            image: AssetImage(getZoomPicture(1)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectBox(2);
                        setState(() {});
                      },
                      child: Ink(
                        child: Center(
                          child: Image(
                            image: AssetImage(getZoomPicture(2)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (boxSelected) Container(height: 40),
            if (boxSelected)
              FutureBuilder<List<Lagerartikel>>(
                future: lagerartikelList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No data available');
                  } else {
                    return Table(
                      border: TableBorder.all(color: Colors.black),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        const TableRow(
                          decoration: BoxDecoration(color: Colors.red),
                          children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Gegenstand'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Anzahl'),
                              ),
                            ),
                          ],
                        ),
                        ...snapshot.data!.map((item) {
                          return TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(item.name),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(item.quantity.toString()),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }

  void zoom(int x, int y) {
    boxSectionX = x;
    boxSectionY = y;

    if (x == 1) {
      firstrow = true;
      if (boxSelected == false) {
        boxSelected = true;
      } else {
        boxSelected = false;
      }
    } else {
      firstrow = false;
      if (boxSectionSelected == false) {
        boxSectionSelected = true;
        if (boxSelected == false) {
          boxSectionSelected = true;
          boxSelected = false;
        } else {
          boxSelected = false;
        }
      } else {
        boxSectionSelected = false;
      }
    }
  }

  String getZoomPicture(int position) {
    return 'assets/hochregal/32.jpg';
  }

  void selectBox(int position) {
    boxPosition = position;
    if (boxSelected == false) {
      boxSelected = true;
    } else {
      boxSelected = false;
    }
  }
}

String getBoxname(int x, int y) {
  return 'aaaaaaaa';
}

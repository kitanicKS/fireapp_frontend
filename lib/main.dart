import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
// ignore: uri_does_not_exist
import 'constants.dart';


final Logger _logger = Logger('MyAppLogger');

void _setupLogging() {
  Logger.root.level = Level.ALL; // Set the logging level to ALL
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
  });
}

Future<void> main() async {
  _setupLogging();
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
  int boxSectionX = 0;
  int boxSectionY = 0;
  int boxPosition = 0;
  List<dynamic> fetchedData = [];

// ignore: undefined_identifier
  final String apiUrl = apiurl;
// ignore: undefined_identifier
  final String apiUsername = apiusername;
// ignore: undefined_identifier
  final String apiPassword = apipassword;

  Future<List<dynamic>> fetchData(String url, String username, String password) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _loadData() async {
    try {
      List<dynamic> data = await fetchData(apiUrl, apiUsername, apiPassword);
      setState(() {
        fetchedData = data;
      });
      _logger.info('Data loaded: $data');
    } catch (e) {
      _logger.severe('Failed to load data', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _loadData,
              child: Text('Load Data'),
            ),
            Container(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          zoom(1, 4);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/14.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(1, 3);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/13.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(1, 2);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/12.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(1, 1);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/11.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          zoom(2, 4);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/24.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(2, 3);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/23.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(2, 2);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/22.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(2, 1);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/21.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          zoom(3, 4);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/34.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(3, 3);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/33.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(3, 2);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/32.jpg'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          zoom(3, 1);
                          setState(() {});
                        },
                        child: Ink(
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/hochregal/31.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
            ),
            if (boxSectionSelected)
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
              Table(
                border: TableBorder.all(color: Colors.black),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                  ...fetchedData.map((item) {
                    return TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(item['la_name']),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(item['la_anzahl'].toString()),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void zoom(int x, int y) {
    boxSectionX = x;
    boxSectionY = y;
    if (boxSectionSelected == false) {
      boxSectionSelected = true;
    } else {
      boxSectionSelected = false;
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

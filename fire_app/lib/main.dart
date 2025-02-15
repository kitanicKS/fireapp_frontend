import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'constants.dart';

Future<List<dynamic>> fetchData(String url, String username, String password) async {
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password')),
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hochregallager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool boxSectionSelected = false;
  bool boxSelected = false;
  int boxSectionX = 0;
  int boxSectionY = 0;
  int boxPosition = 0;

  void _loadData() async {
    String url = apiurl;
    String username = apiusername;
    String password = apipassword;

    try {
      List<dynamic> data = await fetchData(url, username, password);
      print(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data loaded: ${data.toString()}')),
    );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body: Center(
          //child: SingleChildScrollView(
          child: Column(children: [
                        ElevatedButton(
              onPressed: _loadData,
              child: Text('Load /lagerort'),
            ),
        Container(
          height: 30,
        ),
        Row(children: [
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
                  )))),
              InkWell(
                  onTap: () {
                    zoom(1, 3);
                    setState(() {});
                  },
                  child: Ink(
                      child: Center(
                          child: Image(
                    image: AssetImage('assets/hochregal/13.jpg'),
                  )))),
              InkWell(
                  onTap: () {
                    zoom(1, 2);
                    setState(() {});
                  },
                  child: Ink(
                      child: Center(
                          child: Image(
                    image: AssetImage('assets/hochregal/12.jpg'),
                  )))),
              InkWell(
                  onTap: () {
                    zoom(1, 1);
                    setState(() {});
                  },
                  child: Ink(
                      child: Center(
                          child: Image(
                    image: AssetImage('assets/hochregal/11.jpg'),
                  ))))
            ],
          )),
          Expanded(
              child: Column(children: [
            InkWell(
                onTap: () {
                  zoom(2, 4);
                  setState(() {});
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/24.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(2, 3);
                  setState(() {});
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/23.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(2, 2);
                  setState(() {});
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/22.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(2, 1);
                  setState(() {});
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/21.jpg'),
                ))))
          ])),
          Expanded(
              child: Column(children: [
            InkWell(
                onTap: () {
                  zoom(3, 4);
                  setState(() {});
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/34.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(3, 3);
                  setState(() {});
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/33.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(3, 2);
                  setState(() {});
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/32.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(3, 1);
                  setState(() {});
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/31.jpg'),
                ))))
          ])),
        ]),
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
                      ))))),
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
                      )))))
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
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Anzahl'),
                    ))
                  ]),
              ...List.generate(
                  3,
                  (index) => const TableRow(children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Gegenstand'),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Anzahl'),
                            ))
                      ]))
            ],
          )
      ]) //)
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

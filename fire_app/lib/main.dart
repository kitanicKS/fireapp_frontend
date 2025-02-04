import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(children: [
        Expanded(
            child: Column(
          children: [
            InkWell(
                onTap: () {
                  zoom(1, 4);
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/14.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(1, 3);
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/13.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(1, 2);
                },
                child: Ink(
                    child: Center(
                        child: Image(
                  image: AssetImage('assets/hochregal/12.jpg'),
                )))),
            InkWell(
                onTap: () {
                  zoom(1, 1);
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
              },
              child: Ink(
                  child: Center(
                      child: Image(
                image: AssetImage('assets/hochregal/24.jpg'),
              )))),
          InkWell(
              onTap: () {
                zoom(2, 3);
              },
              child: Ink(
                  child: Center(
                      child: Image(
                image: AssetImage('assets/hochregal/23.jpg'),
              )))),
          InkWell(
              onTap: () {
                zoom(2, 2);
              },
              child: Ink(
                  child: Center(
                      child: Image(
                image: AssetImage('assets/hochregal/22.jpg'),
              )))),
          InkWell(
              onTap: () {
                zoom(2, 1);
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
              },
              child: Ink(
                  child: Center(
                      child: Image(
                image: AssetImage('assets/hochregal/34.jpg'),
              )))),
          InkWell(
              onTap: () {
                zoom(3, 3);
              },
              child: Ink(
                  child: Center(
                      child: Image(
                image: AssetImage('assets/hochregal/33.jpg'),
              )))),
          InkWell(
              onTap: () {
                zoom(3, 2);
              },
              child: Ink(
                  child: Center(
                      child: Image(
                image: AssetImage('assets/hochregal/32.jpg'),
              )))),
          InkWell(
              onTap: () {
                zoom(3, 1);
              },
              child: Ink(
                  child: Center(
                      child: Image(
                image: AssetImage('assets/hochregal/31.jpg'),
              ))))
        ])),
      ])),
    );
  }
}

String getsectionPicture(int x, int y) {
  return 'assets/Saeule.jpg';
}

String zoom(int x, int y) {
  return 'assets/Saeule.jpg';
}

String getBoxname(int x, int y) {
  return 'aaaaaaaa';
}

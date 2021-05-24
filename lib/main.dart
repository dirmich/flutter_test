import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertest/class/member.dart';
import 'package:http/http.dart';

import 'member_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late Future<Album> futureAlbum;
  late Future<List<Member>> futureMember;

  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
    var rng = new Random();
    futureMember = fetchMembers(client: Client(), count: rng.nextInt(30) + 20);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Test'),
        ),
        body: MemberView(futureMember: futureMember),
      ),
    );
  }
}

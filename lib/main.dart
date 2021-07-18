import 'package:flutter/material.dart';
import 'detail.dart';
import 'list.dart';
import 'routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.teal),
        title: 'List View Demo',
        debugShowCheckedModeBanner: false,
        home: GitHub(),
        routes: <String, WidgetBuilder>{
          DETAIL: (BuildContext context) => Details(),
          GITHUB: (BuildContext context) => GitHub(),
        });
  }
}

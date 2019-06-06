import 'package:components/src/pages/home_temp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Components'),
          ),
          body: HomePageTemp()),
    );
  }
}

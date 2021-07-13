import 'package:flutter/material.dart';
import 'package:animated_appbar/animated_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackScaffold(
        
      ),
    );
  }
}

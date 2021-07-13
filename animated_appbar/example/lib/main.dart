import 'package:animated_appbar_example/page1.dart';
import 'package:animated_appbar_example/page2.dart';
import 'package:flutter/material.dart';
import 'package:animated_appbar/animated_appbar.dart';

typedef VoidCallback = void Function();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin{
  
  bool navigatePage2 = false;
  late AnimationController scaleController;
  
  void voidCallback(){
    scaleController.forward();
    Future.delayed(Duration(milliseconds: 600),(){
      setState(() {
              navigatePage2 = !navigatePage2;
            });
    });
  }

  @override
  void initState() {
    super.initState();
    scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              scaleController.reverse();
              // page transition logic
            }
    }); 
  }
  
  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseLayout(
        appbar: AnimatedAppbar(
          controller: scaleController,
          initHeight: 135.0,
          backgroundColor: Colors.pink,
          child: Column(
            children: [
              Text("this is"),
              Text("app bar"),
            ],
          ),
        ),
        scaffold: navigatePage2? Page2(callback: voidCallback):Page1(callback: voidCallback),
      ),
    );
  }
}

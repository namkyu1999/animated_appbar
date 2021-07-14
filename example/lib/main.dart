import 'package:flutter/material.dart';
import 'package:animated_appbar/animated_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin{
  
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // BaseLayout is declared in this package
      home: BaseLayout(
        test: Page2(),
        appbar: AnimatedAppBar(
          initHeight: 135.0,
          backgroundColor: Colors.pink,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("App bar"),
                Text("you can customize here!"),
              ],
            ),
          ),
        ),
        // Set init Page
        scaffold: Page1(),
      ),
    );
  }
}

class Page1 extends StatelessWidget with RoutePage{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
              color: Colors.tealAccent,
              // If you wanna route page, Using routePage(Widget)!
              // This method is specified in RoutePage. You just declare RoutePage class to mixin and using routePage(Widget) !
              child: TextButton(onPressed: ()=> routePage(Page2()), child: Text("page 1 Click here!",style: TextStyle(fontSize: 20,color: Colors.black)))),
      ),
    );
  }
}

class Page2 extends StatelessWidget with RoutePage{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
              color: Colors.pinkAccent,
              child: TextButton(onPressed: () => routePage(Page1()),child: Text("page 2 Click here!",style: TextStyle(fontSize: 20,color: Colors.black)))),
      ),
    );
  }
}
# animated_appbar

[![pub package](https://img.shields.io/pub/v/animated_appbar.svg)](https://pub.dev/packages/animated_appbar)
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>

AppBar which can dynamically change height with page navigation.
![preview](https://raw.githubusercontent.com/namkyu1999/blog/main/flutter_package_animated_appbar/preview.gif)

## Usage

This package is expected to be used with `BaseLayout` and `AnimatedAppBar`

```dart
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

```


If you have any requests / contributes or questions, please feel free to visit [github](https://github.com/namkyu1999/animated_appbar/issues).



import 'package:animated_appbar_example/page1.dart';
import 'package:animated_appbar_example/page2.dart';
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
  
    
  TappedNotifier tappedNotifier = TappedNotifier();
  PageNotifier pageNotifier = PageNotifier();

  void voidCallback(){
    // You must change instance value for changing setstate
    // 여기서 당장 실행되는게 아니라 다른 클래스로 넘어가기 때문에
    // 값에 의한 복사가 아니라 참조에 의한 복사라 값자체로 넘기면 안바뀜
    setState(() => tappedNotifier.setSwitch());
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseLayout(
        appbar: AnimatedAppbar(
          tappedNotifier: tappedNotifier,
          initHeight: 135.0,
          backgroundColor: Colors.pink,
          pageTransitionCallback: () { 
            setState(() => pageNotifier.setSwitch());
          },
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
        scaffold: pageNotifier.changed? Page2(callback: voidCallback):Page1(callback: voidCallback),
      ),
    );
  }
}

class PageNotifier{
  bool _changed = false;
  bool get changed => _changed;
  set changed(bool changed) => _changed=changed;
  void setSwitch(){
    _changed = !_changed;
  }
}
# animated_appbar

[![pub package](https://img.shields.io/pub/v/animated_appbar.svg)](https://pub.dev/packages/animated_appbar)
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>

AppBar which can dynamically change height with page navigation.
![preview](https://raw.githubusercontent.com/namkyu1999/blog/main/flutter_package_animated_appbar/preview.gif)

## Usage

This package is expected to be used with `BaseLayout` and `AnimatedAppbar`

```dart
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
            // If you wanna use setState function,
            // You must use instance value, not primitive value.
            // Because this function run in another area(function),
            // primitive valus are call-by-value,
            // instance values are call-by-reference
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

    typedef VoidCallback = void Function();

    class Page1 extends StatelessWidget {

        final VoidCallback callback;
        
        const Page1({ Key? key,required this.callback }) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                    body: Center(
                    child:Container(
                        color: Colors.tealAccent,
                        child: TextButton(onPressed: callback, child: Text("page 1 Click here!",style: TextStyle(fontSize: 20,color: Colors.black)))),
                ),
            );
        }
    }
    class Page2 extends StatelessWidget {

        final VoidCallback callback;
        
        const Page2({ Key? key,required this.callback }) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                body: Center(
                    child:Container(
                        color: Colors.pinkAccent,
                        child: TextButton(onPressed: callback, child: Text("page 2 Click here!",style: TextStyle(fontSize: 20,color: Colors.black)))),
                ),
            );
        }
    }

```


If you have any requests / contributes or questions, please feel free to visit [github](https://github.com/namkyu1999/animated_appbar/issues).



import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class AnimatedAppbar extends StatefulWidget{
  
  final Widget child;
  final Color? backgroundColor;
  final double initHeight;
  final VoidCallback pageTransitionCallback;
  final TappedNotifier tappedNotifier;
  AnimatedAppbar({required this.child, this.backgroundColor, required this.initHeight,required this.tappedNotifier,required this.pageTransitionCallback});

  @override
  _AnimatedAppbarState createState() => _AnimatedAppbarState();

}

class _AnimatedAppbarState extends State<AnimatedAppbar> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double tappedValue = widget.tappedNotifier.isTapped? 0 : size.height - widget.initHeight;

    return AnimatedPadding(
        onEnd: () {
          if(widget.tappedNotifier.isTapped == true){
            setState(() {
                widget.tappedNotifier.isTapped = false;
                widget.pageTransitionCallback();
            });
          }
        },
        padding: EdgeInsets.fromLTRB(0,0,0,tappedValue),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
        child: Container(
          width: size.width,
          height: size.height,
          child: widget.child,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50)
            ),
          ),
        ),
    );
  }
}

class BaseLayout extends StatefulWidget {
  
  final Widget scaffold;
  final Widget appbar;

  const BaseLayout({required this.scaffold,required this.appbar });
  
  @override
  BaseLayoutState createState() => BaseLayoutState();
}

class BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.scaffold,
          widget.appbar,
        ],
      ),
    );
  }
}

class TappedNotifier{
  
  bool isTapped = false ;
  
  void setSwitch(){
    isTapped = !isTapped;
  }
}
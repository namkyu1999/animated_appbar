import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class AnimatedAppbar extends StatefulWidget{
  
  final Widget child;
  final Color? backgroundColor;
  final double initHeight;
  final AnimationController controller;
  const AnimatedAppbar({required this.child,  this.backgroundColor, required this.controller, required this.initHeight});

  @override
  _AnimatedAppbarState createState() => _AnimatedAppbarState();

}

class _AnimatedAppbarState extends State<AnimatedAppbar> {

  late Animation<double> scaleAnimation;
  
  
  Widget _buildAnimation(BuildContext context, Widget? child) {

    scaleAnimation =
        Tween<double>(begin: widget.initHeight, end: MediaQuery.of(context).size.height).animate(
          CurvedAnimation(
            parent: widget.controller,
            curve: Interval(
              0,
              1,
              curve: Curves.easeOutCubic,
            ),
            reverseCurve: Interval(
              0,
              1,
              curve: Curves.easeInOut,
            ),
          )
    );

    return Container(
      decoration: BoxDecoration(
        color:  widget.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
      ),
      width: double.infinity,
      height: scaleAnimation.value,
      child: widget.child, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}

class BaseLayout extends StatefulWidget {
  
  final Widget scaffold;
  final Widget appbar;
  const BaseLayout({ Key? key,required this.scaffold,required this.appbar }) : super(key: key);
  
  @override
  Base_LayoutState createState() => Base_LayoutState();
}

class Base_LayoutState extends State<BaseLayout> {
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
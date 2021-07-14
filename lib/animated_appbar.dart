import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedAppBar extends StatefulWidget{
  
  final Widget child;
  final Color? backgroundColor;
  final double initHeight;

  AnimatedAppBar({required this.child, this.backgroundColor, required this.initHeight});

  @override
  _AnimatedAppBarState createState() => _AnimatedAppBarState();

}

class _AnimatedAppBarState extends State<AnimatedAppBar> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
  
    return GetBuilder<PageChangedNotifier>(
      builder:(controller){
        var isTapped = controller.isTapped;
        double tappedValue = isTapped? 0 : size.height - widget.initHeight;
        return AnimatedPadding(
            onEnd: () {
              if(isTapped == true){
                controller.tapped();
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
    );
  }
}

class BaseLayout extends StatefulWidget {
  
  final Widget scaffold;
  final Widget appbar;

  BaseLayout({required this.scaffold,required this.appbar}){
    Get.put(PageChangedNotifier(scaffold));
  }
  
  @override
  BaseLayoutState createState() => BaseLayoutState();
}

class BaseLayoutState extends State<BaseLayout> {
  
  @override
  Widget build(BuildContext context) {

    return GetBuilder<PageChangedNotifier>(
        builder:(controller)=> Scaffold(
        body: Stack(
            children: [
              controller.page,
              widget.appbar,
            ],
          ),
      ),
    );
  }
}

class PageChangedNotifier extends GetxController{
  
  Widget page;
  bool isTapped = false;

  PageChangedNotifier(Widget page):this.page=page;

  void transition(Widget page){
    tapped();
    Future.delayed(Duration(milliseconds: 600),()=>setPage(page));
  }

  void setPage(Widget page){
    this.page = page;
    update();
  }

  void tapped(){
    isTapped = !isTapped;
    update();
  }
}

class RoutePage{
  void routePage(Widget page){
    Get.find<PageChangedNotifier>().transition(page);
  }
}
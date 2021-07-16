import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack/stack.dart' as Collection;

class AnimatedAppBar extends StatefulWidget{
  
  final Widget child;
  final Color? backgroundColor;
  final double initHeight;

  Widget getChild(){
    return child;
  }
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
              child: AnimatedSwitcher(
                duration:Duration(milliseconds : 600),
                child:controller.appBar,
              ),
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
  final AnimatedAppBar appBar;

  BaseLayout({required this.scaffold,required this.appBar});
  
  @override
  BaseLayoutState createState() => BaseLayoutState();
}

class BaseLayoutState extends State<BaseLayout> {

  @override
  void initState() {
    Get.put(PageChangedNotifier(page: widget.scaffold,appBar: widget.appBar.getChild()));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return GetBuilder<PageChangedNotifier>(
        builder:(controller)=> Scaffold(
        body: Stack(
            children: [
              controller.page,
              widget.appBar,
            ],
          ),
      ),
    );
  }
}

class PageChangedNotifier extends GetxController{
  
  late Collection.Stack<Widget> _page = Collection.Stack<Widget>();
  late Collection.Stack<Widget> _appBar = Collection.Stack<Widget>();
  bool isTapped = false;

  Widget get page => _page.top();
  Widget get appBar => _appBar.top(); 

  PageChangedNotifier({required Widget page,required Widget appBar}){
    this._page.push(page);
    this._appBar.push(appBar);
  }

  void transition(Widget page, [Widget? appBar]){
    tapped();
    Future.delayed(Duration(milliseconds: 600),()=>setPage(page));
    if (appBar != null) Future.delayed(Duration(milliseconds: 300),()=>setAppBar(appBar));
  }
  
  void popTransition(){
    tapped();
    Future.delayed(Duration(milliseconds: 600),()=>popPage());
    Future.delayed(Duration(milliseconds: 300),()=>popAppBar());
  }
  void setAppBar(Widget appBar){
    this._appBar.push(appBar);
    update();
  }
  void popAppBar(){
    if(this._appBar.size()>1)this._appBar.pop();
    update();
  }
  void setPage(Widget page){
    this._page.push(page);
    update();
  }
  void popPage(){
    if(this._page.size()>1)this._page.pop();
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
  void routePageWithNewAppBar(Widget page,Widget appBar){
    Get.find<PageChangedNotifier>().transition(page,appBar);
  }
  void previousPage(){
    Get.find<PageChangedNotifier>().popTransition();
  }
}
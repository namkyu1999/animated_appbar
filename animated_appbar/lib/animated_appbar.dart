import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StackScaffold extends Scaffold {
  StackScaffold(
    {Key? key,
    PreferredSizeWidget? appBar, 
    Widget? body, Widget? 
    floatingActionButton, 
    FloatingActionButtonLocation? floatingActionButtonLocation, 
    FloatingActionButtonAnimator? floatingActionButtonAnimator, 
    List<Widget>? persistentFooterButtons, 
    Widget? drawer, 
    DrawerCallback? onDrawerChanged, 
    Widget? endDrawer, 
    DrawerCallback? onEndDrawerChanged, 
    Widget? bottomNavigationBar, 
    Widget? bottomSheet, 
    Color? backgroundColor, 
    bool? resizeToAvoidBottomInset, 
    bool primary = true, 
    DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start,
    Color? drawerScrimColor, 
    double? drawerEdgeDragWidth,
    String? restorationId}):super(
      extendBodyBehindAppBar: true,
      key: key,
      appBar: appBar, 
      body: body,
      floatingActionButton: floatingActionButton, 
      floatingActionButtonLocation: floatingActionButtonLocation, 
      floatingActionButtonAnimator: floatingActionButtonAnimator, 
      persistentFooterButtons: persistentFooterButtons, 
      drawer: drawer, 
      onDrawerChanged: onDrawerChanged, 
      endDrawer: endDrawer, 
      onEndDrawerChanged: onEndDrawerChanged, 
      bottomNavigationBar: bottomNavigationBar, 
      bottomSheet: bottomSheet, 
      backgroundColor: backgroundColor, 
      resizeToAvoidBottomInset: resizeToAvoidBottomInset, 
      primary: primary, 
      drawerDragStartBehavior: drawerDragStartBehavior,
      drawerScrimColor: drawerScrimColor, 
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      restorationId: restorationId
  );
}


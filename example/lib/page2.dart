import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

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
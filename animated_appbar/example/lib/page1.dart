import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class Page1 extends StatelessWidget {

  final VoidCallback callback;
  
  const Page1({ Key? key,required this.callback }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("page 1"),
            Container(
              color: Colors.tealAccent,
              child: TextButton(onPressed: callback, child: Text("Click here!",style: TextStyle(fontSize: 20,color: Colors.black)))),
          ],
        ),
      ),
    );
  }
}
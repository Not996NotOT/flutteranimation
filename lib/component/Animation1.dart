import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  Animation1({Key key}) : super(key: key);

  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  double _height = 100;
  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.bounceInOut,
          height: _height,
          width: double.infinity,
          color: Colors.blue,
          onEnd: (){
            this.setState(() {
              _opacity = 1;
            });
          },
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 2000),
            child: Center(
              child: Text("nihao"),
            ),
          ),
        ),
        RaisedButton(
          child: Text("animation"),
          onPressed: () {
            this.setState(() {
              _height = 300;
            });
          },
        )
      ],
    ));
  }
}

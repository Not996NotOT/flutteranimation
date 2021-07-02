import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  Animation3({Key key}) : super(key: key);

  @override
  _Animation3State createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1)
        .animate(animationController);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RotationTransition(
            turns: animation,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Text("123456"),
            ),
          ),
        ),
      ),
    );
  }
}

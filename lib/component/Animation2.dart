import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  Animation2({Key key}) : super(key: key);

  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Animation<Offset> animationOffset;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1)
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(animationController);

    animationOffset = Tween<Offset>(begin: Offset(0, -0.5), end: Offset(0, 0))
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SlideTransition(
          position: animationOffset,
          child: Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
              child: Center(child: Text("123"))),
        ),
      ),
    );
  }
}

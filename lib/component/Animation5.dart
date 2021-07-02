import 'package:flutter/material.dart';
import 'package:flutteranimation/component/MyCustomPainter.dart';

class Animation5 extends StatefulWidget {
  Animation5({Key key}) : super(key: key);

  @override
  _Animation5State createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController opacityController;
  Animation<double> opacityAnimation;
  Animation<Offset> animationTop;
  Animation<Offset> animationBottom;
  CurvedAnimation opacityCurvedAnimation;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animationTop = new Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).chain(CurveTween(curve: Curves.bounceOut))
        .animate(animationController);
    animationBottom = new Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(animationController);
    opacityController = new AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(opacityController)
          ..addListener(() {
            if (opacityController.isCompleted) {
              animationController.forward();
            }
          });
    opacityCurvedAnimation =
        new CurvedAnimation(parent: opacityAnimation, curve: Curves.easeIn);
    //animationController.forward();
    opacityController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
        body: Container(
            child: Stack(
      children: [
        Align(
            child: FadeTransition(
          opacity: opacityCurvedAnimation,
          child: Text("123"),
        )),
        Column(
          children: [
            SlideTransition(
              position: animationTop,
              child: CustomPaint(
                  painter: MyCustomPainter(color: Colors.blue),
                  child: Container(
                      height: data.size.height * .5,
                      width: double.infinity,
                      child: Center(
                        child: Text("图片一"),
                      ))),
            ),
            SlideTransition(
                position: animationBottom,
                child: Container(
                    height: data.size.height * .5,
                    width: double.infinity,
                    child: Center(
                      child: Text("图片二"),
                    ))),
          ],
        )
      ],
    )));
  }
}

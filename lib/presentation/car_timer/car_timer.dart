import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:timers/presentation/car_timer/car_timer_painter.dart';
class CarTimer extends StatefulWidget {
  final List<ui.Image> image;
  const CarTimer({required this.image, Key? key}) : super(key: key);

  @override
  _CarTimerState createState() => _CarTimerState();
}

class _CarTimerState extends State<CarTimer> with SingleTickerProviderStateMixin {

  //ui.Image? image;

  double _fraction = 0.0;
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });
      });
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();

  }



  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Container(
            width: 400,
            height: 400,
            color: Colors.lightBlue,
            child:
                CustomPaint(
                  child: Container(),
                  painter: CarTimePainter(widget.image, _fraction),
                ),
          ),
          /*FloatingActionButton(
              child: Container(
                child: Text("StartAnimation"),
                color: Colors.blueAccent,
              ),
            onPressed: (){},
          ),*/
        ],
      );
  }
}

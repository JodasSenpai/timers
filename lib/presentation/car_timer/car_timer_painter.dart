import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class CarTimePainter extends CustomPainter{
  final List<ui.Image> image;
  Paint _paint = Paint()..color = Colors.blueAccent;
  final double _fraction;
  CarTimePainter(this.image,this._fraction) {


  }
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(0, 0);
    print("paint: "+_fraction.toString());
    int img = 0;
    if(_fraction > 0 && _fraction <= 0.10){

    }else if(_fraction > 0.10 && _fraction <= 0.20){
      img = 0;
    }else if(_fraction > 0.20 && _fraction <= 0.30){
      img = 1;
    }else if(_fraction > 0.30 && _fraction <= 0.40){
      img = 2;
    }else if(_fraction > 0.40 && _fraction <= 0.50){
      img = 0;
    }else if(_fraction > 0.50 && _fraction <= 0.60){
      img = 1;
    }else if(_fraction > 0.60 && _fraction <= 0.70){
      img = 2;
    }else if(_fraction > 0.70 && _fraction <= 0.80){
      img = 0;
    }else if(_fraction > 0.80 && _fraction <= 0.90){
      img = 1;
    }else if(_fraction > 0.90 && _fraction <= 1.00){
      img = 2;
    }
    canvas.drawImage(image[img], Offset(0,(size.height-image[img].height)*_fraction), _paint);
  }

  @override
  bool shouldRepaint(CarTimePainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:timers/presentation/core/widget/bottom_bar.dart';
import 'package:timers/presentation/car_timer/car_timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ui.Image> image = [];
  Future loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() {
      this.image.add(image);
    });
  }
  void initState() {
    super.initState();
    loadImage('assets/otter/otter_run_1.png');
    loadImage('assets/otter/otter_run_2.png');
    loadImage('assets/otter/otter_run_3.png');
  }

  @override
  Widget build(BuildContext context) {
    Widget w;
    if(image.length > 2){
      w = CarTimer(image: image,);
    }else{
      w = Container();
    }

    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: Container(
        child: w
      ),
    );
  }


}



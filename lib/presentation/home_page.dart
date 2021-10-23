import 'package:flutter/material.dart';
import 'package:timers/presentation/core/widget/bottom_bar.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: Center(
        child: Text("Center"),
      ),
    );
  }
}

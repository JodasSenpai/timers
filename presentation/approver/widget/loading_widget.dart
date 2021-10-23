import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height / 3;
    return SizedBox(
      height: size,
      width: size,
      child: const CircularProgressIndicator(),
    );
  }
}

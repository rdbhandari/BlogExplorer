// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loading1() {
  return Center(
    child: LoadingAnimationWidget.halfTriangleDot(
      color: Colors.blueAccent,
      size: 60,
    ),
  );
}

Widget loading2() {
  return Center(
    child: LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.red,
      size: 30,
    ),
  );
}

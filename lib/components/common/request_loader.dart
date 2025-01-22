import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RequestLoader extends StatelessWidget {
  const RequestLoader({super.key});

  @override
  Widget build(context) {
    return Positioned.fill(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: const Center(
          child: SpinKitThreeBounce(
            color: Colors.orange,
            size: 25,
          ),
        ), // Change this to the desired background color
      ),
    );
  }
}

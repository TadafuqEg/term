import 'package:flutter/material.dart';

class BackGroundCircle extends StatelessWidget {
  final circleBorderWidth;
  final circleOpacity;
  final circleWidth;
  final circleColor;
  const BackGroundCircle({super.key,
    required this.circleBorderWidth,
    required this.circleColor,
    required this.circleOpacity,
    required this.circleWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleWidth,
      height: circleWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: circleColor.withOpacity(circleOpacity),
             width: circleBorderWidth
        ),

      ),
    );
  }
}

import 'package:flutter/material.dart';

//Here I used CustomPainter to build a unique shape
class CustomShape extends CustomPainter {
  bool nuovo;
  CustomShape(this.nuovo);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = nuovo ? Color.fromARGB(255, 162, 156, 189) : Colors.orangeAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    Path path0 = Path();
    path0.moveTo(size.width * 0.0011351, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height * 0.9970588);
    path0.lineTo(0, size.height * 0.6645882);
    path0.lineTo(0, 0);
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

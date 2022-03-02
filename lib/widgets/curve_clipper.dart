import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset curverPoint = Offset(size.width / 4, size.height);
    Offset centerPoint = Offset(size.width / 2, 4 * size.height / 5);
    Offset curverPoint2 = Offset(3 * size.width / 4, 3 * size.height / 5);
    Offset endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
        curverPoint.dx, curverPoint.dy, centerPoint.dx, centerPoint.dy);
    path.quadraticBezierTo(
        curverPoint2.dx, curverPoint2.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

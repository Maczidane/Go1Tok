import 'package:Go1Tok/src/constants/size.dart';
import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    // TODO: implement getClip
    //throw UnimplementedError();
    final Path path = Path();

    path.lineTo(0.0, size.height);
    //path.lineTo(size.width, size.height);

    var firstEndPoint = Offset(size.width * firstEndPointWidth,  size.height - firstEndPointHeight);
    var firstControlPoint = Offset(size.width * firstControlPointWidth, size.height - firstControlPointHeight);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width ,  size.height - secondEndPointHeight);
    var secondControlPoint = Offset(size.width * secondControlPointWidth, size.height - secondControlPointHeight);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
   return true;
  }
  
}
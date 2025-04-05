import 'dart:math';

import 'package:flutter/material.dart';

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I've taken approximate height of curved part of view
    // Change it if you have exact spec for it
    final roundingHeight = size.height * 3 / 3.8;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        -20, size.height - roundingHeight * 2, size.width + 20, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    // Bottom Left Concave
    final c1x = size.width * 0.1; // Adjust these percentages
    final c1y = size.height * 0.78;
    final e1x = size.width * 0.3;
    final e1y = size.height * 0.72;
    path.quadraticBezierTo(c1x, c1y, e1x, e1y);

    // Midpoint Convex
    final c2x = size.width * 0.5; // Adjust these percentages
    final c2y = size.height * 0.65;
    final e2x = size.width * 0.72;
    final e2y = size.height * 0.65;
    path.quadraticBezierTo(c2x, c2y, e2x, e2y);

    // Top Right Concave
    final c3x = size.width * 0.96; // Adjust these percentages
    final c3y = size.height * 0.68;
    final e3x = size.width;
    final e3y = size.height * 0.2;
    path.quadraticBezierTo(c3x, c3y, e3x, e3y);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, 260);
//     path.quadraticBezierTo(size.width / 4, 160, size.width / 2, 175);
//     path.quadraticBezierTo(3 / 3.4 * size.width, 190, size.width, 80);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.9);

    var firstControlPoint = Offset(size.width * 0.1, size.height * 0.65);
    var firstEndPoint = Offset(size.width * 0.45, size.height * 0.63);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.95, size.height * 0.6);
    var secondEndPoint = Offset(size.width, size.height * 0.2);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height * 0.9);

//     var firstControlPoint = Offset(size.width * 0.2, size.height * 0.7);
//     var firstEndPoint = Offset(size.width * 0.6, size.height * 0.6);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     var secondControlPoint = Offset(size.width * 0.88, size.height * 0.5);
//     var secondEndPoint = Offset(size.width, size.height * 0.2);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);

//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }


// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height * 0.8);

//     var firstControlPoint = Offset(size.width * 0.2, size.height * 0.4);
//     var firstEndPoint = Offset(size.width * 0.56, size.height * 0.46);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     var secondControlPoint = Offset(size.width * 0.89, size.height * 0.5);
//     var secondEndPoint = Offset(size.width, size.height * 0.2);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);

//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
import 'package:flutter/material.dart';

class gridPainter extends StatefulWidget{
  @override
  _tictactoe createState() => _tictactoe();
}

class _tictactoe extends State<gridPainter>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 210,
      child: CustomPaint(
        painter: tictactoePainter(),
      ),
    );
  }
}

class tictactoePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    var fillBrush = Paint();
      fillBrush.color = Colors.grey[100];
      fillBrush.strokeWidth = 5;
      fillBrush.strokeCap = StrokeCap.round;
      fillBrush.style = PaintingStyle.stroke;
    var greyBrush = Paint();
    greyBrush.color = Colors.blueGrey[800];
    greyBrush.strokeWidth = 5;


    canvas.drawLine(
        Offset (0, size.height/3),
        Offset (size.width, size.height/3),
        fillBrush,);
    canvas.drawLine(
      Offset (0, size.height/1.5),
      Offset (size.width, size.height/1.5),
      fillBrush,);
    canvas.drawLine(
      Offset (size.width/3, 0),
      Offset (size.width/3, size.width),
      fillBrush,);
    canvas.drawLine(
      Offset (size.width/1.5, 0),
      Offset (size.width/1.5,size.width),
      fillBrush,);
    canvas.drawCircle(
        Offset (size.width/6, size.height/7),
        20.0,
        fillBrush);
    canvas.drawLine(
      Offset(120, 120),
      Offset(90, 90),
      fillBrush,
    );
    canvas.drawLine(
      Offset(90, 120),
      Offset(120, 90),
      fillBrush,
    );
    canvas.drawCircle(
        Offset (size.width/1.2, size.height/6.6),
        20.0,
        fillBrush);
    canvas.drawLine(
      Offset(190, 190),
      Offset(160, 160),
      fillBrush,
    );
    canvas.drawLine(
      Offset(160, 190),
      Offset(190, 160),
      fillBrush,
    );

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}
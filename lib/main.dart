import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/gridPainter.dart';
import 'home.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin{
  static var game_font = GoogleFonts.pangolin(
      textStyle: TextStyle(color: Colors.grey[100], fontSize: 20));
  static var title_font = GoogleFonts.pangolin(
      textStyle: TextStyle(color: Colors.grey[100], fontSize: 50));
  static var start_font = GoogleFonts.pangolin(
      textStyle: TextStyle(color: Colors.grey[100], fontSize: 40));

  bool run = true;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Container(
                      child: Text(
                        "TIC TAC TOE",
                        style: title_font,
                      ),
                    ),
                  ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  width: 210,
                  height: 210,
                  child: AnimatedDrawing.svg(
                    "assets/tictactoe.svg",
                    run: this.run,
                    duration: new Duration(seconds: 5),
                    lineAnimation: LineAnimation.oneByOne,
                    animationCurve: Curves.linear,
                    onFinish: () => setState(() {
                      this.run = true;
                    }),
                  ),
                  //color: Colors.black,
                  //child: gridPainter(),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 80,left:70, right: 70, bottom: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 250,
                        height: 80,
                        color: Colors. blueGrey[700],
                        child: Center(
                          child: Text(
                            'START',
                            textAlign: TextAlign.center,
                            style: start_font,
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ],
            ),
          ),
        ),
      );
  }
}



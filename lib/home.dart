import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool O = false;
  int o_win = 0;
  int x_win = 0;
  var text_style = TextStyle(color: Colors.grey[100], fontSize: 20);
  List<String> displayXO = ['','','','','','','','',''];

  static var game_font = GoogleFonts.pangolin(
      textStyle: TextStyle(color: Colors.grey[100], fontSize: 20));
  static var black_font = GoogleFonts.pangolin(
      textStyle: TextStyle(color: Colors.black, fontSize: 20));

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Column(
        children: <Widget>[
          Expanded(
            //Scoreboard
            child: Container(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 50,),
                    child: Column(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroScreen()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.grey[100],
                              size: 30,
                            ),
                        ),
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0, left: 50,right: 15.0,),
                    child: Column(
                          children: <Widget>[
                            Text('Player X', style: game_font,),
                            Text(x_win.toString(), style: game_font,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0, left: 15.0,),
                    child: Column(
                      children: <Widget>[
                        Text('Player O', style: game_font,),
                        Text(o_win.toString(), style: game_font,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3),
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: ()
                    {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey[700])
                      ),
                      child: Center(
                        child:Text(displayXO[index], style: game_font),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  int tap_count = 0;

  void _tapped(int index) {
    setState(() {
      if (O && displayXO[index] == ''){
        displayXO[index] = 'o';
        tap_count++;
      }
      else if (!O && displayXO[index] == ''){
        displayXO[index] = 'x';
        tap_count++;
      }
      O = !O;
      _checkWinner();
    });
  }

  void _checkWinner(){
    if (displayXO[0] == displayXO[1] && displayXO[1] == displayXO[2] && displayXO[0] != ''){
      _showWinner(0);
    }
    if(displayXO[3] == displayXO[4] && displayXO[4] == displayXO[5] && displayXO[3] != ''){
      _showWinner(3);
    }
    if(displayXO[6] == displayXO[7] && displayXO[7] == displayXO[8] && displayXO[6] != ''){
      _showWinner(6);
    }
    if(displayXO[0] == displayXO[3] && displayXO[3] == displayXO[6] && displayXO[0] != ''){
      _showWinner(0);
    }
    if(displayXO[1] == displayXO[4] && displayXO[4] == displayXO[7] && displayXO[1] != ''){
      _showWinner(1);
    }
    if(displayXO[2] == displayXO[5] && displayXO[5] == displayXO[8] && displayXO[2] != ''){
      _showWinner(2);
    }
    if(displayXO[0] == displayXO[4] && displayXO[4] == displayXO[8] && displayXO[0] != ''){
      _showWinner(0);
    }
    if(displayXO[2] == displayXO[4] && displayXO[4] == displayXO[6] && displayXO[2] != ''){
      _showWinner(2);
    }
    if (tap_count == 9){
      _tie();
    }
  }

  void _tie(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: 250,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/XOsX.gif"),
                        )
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Close game! It was a tie.",

                      ),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.grey[100],
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => IntroScreen()),
                                );
                              },
                              child: Text(
                                  'Exit',
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                            ),
                            RaisedButton(
                              color: Colors.blueGrey[800],
                              onPressed: (){
                                _clearBoard();
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Play Again',
                                style: TextStyle(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  void _showWinner(int index){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          if (displayXO[index] == 'o'){
            o_win++;
          }
          else{
            x_win++;
          }
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: 250,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/giphy.gif"),
                        )
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Yayyy! " + displayXO[index].toUpperCase() + " wins!",

                      ),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.grey[100],
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => IntroScreen()),
                                );
                              },
                              child: Text(
                                'Exit',
                                style: TextStyle(
                                  color: Colors.blueGrey[900],
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                            ),
                            RaisedButton(
                              color: Colors.blueGrey[800],
                              onPressed: (){
                                _clearBoard();
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Play Again',
                                style: TextStyle(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  void _clearBoard(){
    setState(() {
      tap_count = 0;
      for (int i = 0; i < 9; i++){
        displayXO[i] = '';
      }
    });

  }
}
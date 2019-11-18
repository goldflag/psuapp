import 'package:psu_calculator/psucalculator/simple_calculator.dart';
import 'package:psu_calculator/power_calculator.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(title: 'MyApp', initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => ExampleForm(),
      '/third': (context) => PowerCalc(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container (
          margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 50.0),
        child:
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                      },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 250,
                      height: 250,
                      child:
                      Stack (
                        children: <Widget>[
                          Image.asset('assets/pc3dark.PNG'),
                          Align(
                            alignment: Alignment.center,
                            child: const Text(
                                'PSU Calculator',
                                style:
                                  TextStyle(
                                    fontSize: 22,
                                    shadows: [
                                      Shadow( // bottomLeft
                                          offset: Offset(-1, -1),
                                          color: Colors.black
                                      ),
                                      Shadow( // bottomRight
                                          offset: Offset(1, -1),
                                          color: Colors.black
                                      ),
                                      Shadow( // topRight
                                          offset: Offset(1, 1),
                                          color: Colors.black
                                      ),
                                      Shadow( // topLeft
                                          offset: Offset(-1, 1),
                                          color: Colors.black
                                      ),
                                    ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  //const SizedBox(height: 50),
                  RaisedButton(
                    onPressed: () { Navigator.pushNamed(context, '/third'); },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 250,
                      height: 250,
                      child:
                      Stack (
                        children: <Widget>[
                          Image.asset('assets/pc2dark.PNG'),
                          Align(
                            alignment: Alignment.center,
                            child: const Text(
                                'Power Cost Calculator',
                                style:
                                TextStyle(
                                  fontSize: 22,
                                  shadows: [
                                    Shadow( // bottomLeft
                                        offset: Offset(-1, -1),
                                        color: Colors.black
                                    ),
                                    Shadow( // bottomRight
                                        offset: Offset(1, -1),
                                        color: Colors.black
                                    ),
                                    Shadow( // topRight
                                        offset: Offset(1, 1),
                                        color: Colors.black
                                    ),
                                    Shadow( // topLeft
                                        offset: Offset(-1, 1),
                                        color: Colors.black
                                    ),
                                  ],
                                ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
            ]
          )
        ),
      ),
    );
  }
}
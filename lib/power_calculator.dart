import 'package:flutter/material.dart';

class PowerCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

      return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          titleSpacing: 15.0,
          title: Text(
            'Power Cost Calculator',
            style: TextStyle(fontSize: 20.0),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                ],
              ),
            ),
          ),
        ),
        body:
        ListView(
          children: [
          PowerCalculator(),
          ]
        )
    );
  }
}

class PowerCalculator extends StatefulWidget {
  PowerCalculator();

  @override
  _PowerCalculatorState createState() => _PowerCalculatorState();
}

const multiplier = {
  1 : 0.6,
  2 : 0.8,
  3 : 1,
  4 : 1.2,
  5 : 1.4,
};

const ratingEff = {
  'none' : '70',
  'white' : '80',
  'bronze' : '85',
  'silver' : '88',
  'gold' : '90',
  'platinum' : '92',
  'titanium' : '94',
};

class _PowerCalculatorState extends State<PowerCalculator> {
  
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  dynamic wattage = '1';
  double cost = 0 ;
  String rating = 'none';
  bool pressed = false;
  bool pressedBronze = false;
  bool pressedSilver = false;
  bool pressedGold = false;
  bool pressedPlatinum = false;
  bool pressedTitanium = false;
  double electricityCost = 0.12;
  int dailyUseHours = 4;
  int CPUUseIndex = 3;

  final missingWattage = SnackBar(content: Text('Please Enter a Peak Wattage!'));

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: myController,
            decoration: const InputDecoration(
              icon: Icon(Icons.offline_bolt),
              hintText: 'What is your Peak Wattage?',
              labelText: 'Wattage',
              fillColor: Colors.blueAccent,
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Peak Wattage';
              }
              else {
                wattage = myController.text;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child:
            Text("Choose 80+ Efficieny Rating (if applicable)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: 80,
                  child:
                  FlatButton(
                    onPressed: () {
                      setState(() {
                      if (pressed) {
                        pressed = false;
                        setRating('none');
                      }
                      else {
                        pressed = true;
                        setRating('white');
                        setOthersFalse('white');
                      }
                      });
                    },
                    padding: EdgeInsets.all(0.0),
                    child :
                    Container (
                      decoration: new BoxDecoration(
                          border: pressed ? new Border.all(color: Colors.blueAccent) : null,
                      ),
                      child:
                        Image.asset('assets/80+/80plus.jpg',
                          width: pressed ? 60 : 55,
                        ),
                    )
                  )
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 80,
                    child:
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          if (pressedBronze) {
                            pressedBronze = false;
                            setRating('none');
                          }
                          else {
                            pressedBronze = true;
                            setRating('bronze');
                            setOthersFalse('bronze');
                          }
                        });
                      },
                      padding: EdgeInsets.all(0.0),
                      child:
                      Container (
                        decoration: new BoxDecoration(
                          border: pressedBronze ? new Border.all(color: Colors.blueAccent) : null,
                        ),
                        child:
                        Image.asset('assets/80+/80plusbronze.jpg',
                          width: pressedBronze ? 60 : 55,
                        ),
                      )
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 80,
                    child:
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          if (pressedSilver) {
                            pressedSilver = false;
                            setRating('none');
                          }
                          else {
                            pressedSilver = true;
                            setRating('silver');
                            setOthersFalse('silver');
                          }
                        });
                      },
                      padding: EdgeInsets.all(0.0),
                      child:
                      Container (
                        decoration: new BoxDecoration(
                          border: pressedSilver ? new Border.all(color: Colors.blueAccent) : null,
                        ),
                        child:
                        Image.asset('assets/80+/80plussilver.jpg',
                          width: pressedSilver ? 60 : 55,
                        ),
                      )
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 80,
                    child:
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          if (pressedGold) {
                            pressedGold = false;
                            setRating('none');
                          }
                          else {
                            pressedGold = true;
                            setRating('gold');
                            setOthersFalse('gold');
                          }
                        });
                      },
                      padding: EdgeInsets.all(0.0),
                      child:
                      Container (
                        decoration: new BoxDecoration(
                          border: pressedGold ? new Border.all(color: Colors.blueAccent) : null,
                        ),
                        child:
                        Image.asset('assets/80+/80plusgold.jpg',
                          width: pressedGold ? 60 : 55,
                        ),
                      )
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 80,
                    child:
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          if (pressedPlatinum) {
                            pressedPlatinum = false;
                            setRating('none');
                          }
                          else {
                            pressedPlatinum = true;
                            setRating('platinum');
                            setOthersFalse('platinum');
                          }
                        });
                      },
                      padding: EdgeInsets.all(0.0),
                      child:
                      Container (
                        decoration: new BoxDecoration(
                          border: pressedPlatinum ? new Border.all(color: Colors.blueAccent) : null,
                        ),
                        child:
                        Image.asset('assets/80+/80plusplatinum.jpg',
                          width: pressedPlatinum ? 60 : 55,
                        ),
                      )
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 80,
                    child:
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          if (pressedTitanium) {
                            pressedTitanium = false;
                            setRating('none');
                          }
                          else {
                            pressedTitanium = true;
                            setRating('titanium');
                            setOthersFalse('titanium');
                          }
                        });
                      },
                      padding: EdgeInsets.all(0.0),
                      child:
                      Container (
                        decoration: new BoxDecoration(
                          border: pressedTitanium ? new Border.all(color: Colors.blueAccent) : null,
                        ),
                        child:
                        Image.asset('assets/80+/80plustitanium.jpg',
                          width: pressedTitanium ? 60 : 55,
                        ),
                      )
                    )
                ),
            ]
        ),
          Align(
            alignment: Alignment.center,
            child:
            Text(rating != 'none' ? ratingEff[rating] + "+% Eff @ 50% Load" : '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(height: 10),
          Align(
          alignment: Alignment.center,
          child:
              Text("Cost of electricity per kHw (USD)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              )),
        ),
            Container(
              child:
              Padding(
                padding: EdgeInsets.all(0),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          new Expanded(
                              child: Slider(
                                  value: electricityCost.toDouble(),
                                  min: 0.0,
                                  max: 0.60,
                                  divisions: 29,
                                  activeColor: Colors.blue,
                                  inactiveColor: Colors.black,
                                  label: '\$' + electricityCost.toStringAsFixed(2),
                                  onChanged: (double newValue) {
                                    setState(() {
                                      electricityCost = newValue;
                                    });
                                  },
                                  semanticFormatterCallback: (double newValue) {
                                    return '${newValue.round()} dollars';
                                  }
                                )),])),)),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.center,
            child:
            Text("Daily Use Time",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )),
          ),
          Container(
              child:
              Padding(
                padding: EdgeInsets.all(0),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          new Expanded(
                              child: Slider(
                                  value: dailyUseHours.toDouble(),
                                  min: 0,
                                  max: 24,
                                  divisions: 23,
                                  activeColor: Colors.blue,
                                  inactiveColor: Colors.black,
                                  label: dailyUseHours.toString() + ' Hours',
                                  onChanged: (double newValue) {
                                    setState(() {
                                      dailyUseHours = newValue.toInt();
                                    });
                                  },
                                  semanticFormatterCallback: (double newValue) {
                                    return '${newValue.round()} dollars';
                                  }
                              )),])),)),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.center,
            child:
            Text("Estimated GPU and GPU Load (Low to High)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )),
          ),
          Container(
              child:
              Padding(
                padding: EdgeInsets.all(0),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          new Expanded(
                              child: Slider(
                                  value: CPUUseIndex.toDouble(),
                                  min: 1,
                                  max: 5,
                                  divisions: 4,
                                  activeColor: Colors.blue,
                                  inactiveColor: Colors.black,
                                  label: CPUUseIndex.toString(),
                                  onChanged: (double newValue) {
                                    setState(() {
                                      CPUUseIndex = newValue.toInt();
                                    });
                                  },
                                  semanticFormatterCallback: (double newValue) {
                                    return '${newValue.round()} dollars';
                                  }
                              )),])),)),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                powerCost();
                if (myController.text.length < 1) {
                  Scaffold.of(context).showSnackBar(missingWattage);
                }
              },
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                  'Calculate!',
                  style: TextStyle(fontSize: 20)
              ),
            ),
          ),
          Card(
              margin: EdgeInsets.all(15.0),
              color: Colors.white70,
              child:
              Container (
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                child:
                Align(
                  alignment: Alignment.center,
                  child:
                  Text('\$' + cost.toStringAsFixed(2) + ' / Year',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void powerCost() {
    setState(() {
    cost = ((double.parse(myController.text) * dailyUseHours)/1000)*(electricityCost) * 365 * multiplier[CPUUseIndex];
    if (pressed) {
      cost *= 1.2;
    }
    else if (pressedBronze) {
      cost *= 1.14;
    }
    else if (pressedSilver) {
    cost *= 1.11;
    }
    else if (pressedGold) {
      cost *= 1.09;
    }
    else if (pressedPlatinum) {
      cost *= 1.07;
    }
    else if (pressedTitanium) {
      cost *= 1.05;
    }
    else {
      cost *= 1.3;
    }
    });
  }

  setRating(String x) {
    rating = x;
  }

  setOthersFalse(String x) {
    if (x == 'white') {
      pressedBronze = false;
      pressedSilver = false;
      pressedGold = false;
      pressedPlatinum = false;
      pressedTitanium = false;
    }
    else if (x == 'bronze') {
      pressed = false;
      pressedSilver = false;
      pressedGold = false;
      pressedPlatinum = false;
      pressedTitanium = false;
    }
    else if (x == 'silver') {
      pressed = false;
      pressedBronze = false;
      pressedGold = false;
      pressedPlatinum = false;
      pressedTitanium = false;
    }
    else if (x == 'gold') {
      pressed = false;
      pressedBronze = false;
      pressedSilver = false;
      pressedPlatinum = false;
      pressedTitanium = false;
    }
    else if (x == 'platinum') {
      pressed = false;
      pressedBronze = false;
      pressedSilver = false;
      pressedGold = false;
      pressedTitanium = false;
    }
    else if (x == 'titanium') {
      pressed = false;
      pressedBronze = false;
      pressedSilver = false;
      pressedGold = false;
      pressedPlatinum = false;
    }
  }
}
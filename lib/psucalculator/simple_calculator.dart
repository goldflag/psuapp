import 'package:psu_calculator/dropdownfieldclone.dart';
import 'package:flutter/material.dart';
import 'package:psu_calculator/psucalculator/data.dart';
import 'package:psu_calculator/psucalculator/list.dart';
import 'package:psu_calculator/psucalculator/recommended.dart';

class ExampleForm extends StatefulWidget {
  ExampleForm();

  @override
  _ExampleFormState createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData = {
    'mobo': '1',
    'CPU': '0',
    'GPU': '0',
    'GPUcount' : '1',
    'SSD': '0',
    'HDD': '0',
    'HDDcount': '0',
    'RAM': '0',
    'FAN': '0',
    'Drives': '0',
  };

  _ExampleFormState() {
  }

  dynamic wattage = 0;
  double recommended = 0;
  int rec = 0;
  String test = "";
  bool GPUoc = false;
  bool CPUoc = false;
  double CPUmultiplier = 1.0;
  double GPUmultiplier = 1.0;
  double Moboconsumption = 0;
  double CPUconsumption = 0;
  double GPUconsumption = 0;
  double RAMconsumption = 0;
  double SSDconsumption = 0;
  double HDDconsumption = 0;
  double Driveconsumption = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buildFutures(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            default:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                if (snapshot.data != null)
                  return Scaffold(
                      appBar: AppBar(
                        titleSpacing: 15.0,
                        title: Text(
                          'PSU Wattage Calculator',
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
                        /*
                        actions: <Widget>[
                          Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                  icon: const Icon(Icons.check),
                                  iconSize: 20.0,
                                  tooltip: 'Save',
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      _formKey.currentState.save();
                                      showDialog<String>(
                                          context: context,
                                          builder:
                                              (BuildContext dialogContext) =>
                                              AlertDialog(
                                                content: Text(
                                                    'Data submitted is \n${formData.toString()}'),
                                              ));
                                    }
                                  });
                            },
                          )
                        ],
                        */
                      ),
                      body: Container(
                        color: Colors.white,
                        constraints: BoxConstraints.expand(),
                        child: Form(
                            key: _formKey,
                            autovalidate: false,
                            child: Container(
                                margin: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                                child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Divider(
                                          height: 10.0,
                                          //color: Theme.of(context).primaryColor
                                        ),
                                        DropDownField(
                                            icon: new Image.asset("assets/mobo.png", width: 50, height: 50,),
                                            required: true,
                                            hintText: 'What Motherboard Type',
                                            labelText: 'Motherboard',
                                            items: mobo,
                                            itemsVisibleInDropdown: 3,
                                            setter: (dynamic newValue) {
                                              formData['mobo'] = newValue;
                                            }),
                                        Divider(
                                          height: 10.0,
                                        ),
                                        DropDownField(
                                            icon: new Image.asset("assets/cpu.png", width: 50, height: 50,),
                                            required: true,
                                            hintText: 'Choose a CPU',
                                            labelText: 'CPU',
                                            items: CPUs,
                                            itemsVisibleInDropdown: 6,
                                            setter: (dynamic newValue) {
                                              formData['CPU'] = newValue;
                                            }),
                                        Divider(
                                          height: 10.0,
                                        ),
                                        DropDownField(
                                            icon: new Image.asset("assets/gpu.png", width: 50, height: 50,),
                                            required: false,
                                            hintText: 'Choose a Graphics Card',
                                            labelText: 'Graphics Card',
                                            items: GPUs,
                                            itemsVisibleInDropdown: 6,
                                            setter: (dynamic newValue) {
                                              formData['GPU'] = newValue;
                                            }),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(00.0, 0.0, 0.0, 0.0),
                                          child:
                                          DropDownField(
                                            value: formData['GPUcount'],
                                            icon: new Image.asset("assets/empty.png", width: 50, height: 30,),
                                            required: false,
                                            hintText: 'How many Cards',
                                            labelText: 'GPU Count',
                                            items: GPUcount,
                                            itemsVisibleInDropdown: 2,
                                            setter: (dynamic newValue) {
                                            formData['GPUcount'] = newValue;
                                          }),),
                                        Divider(
                                          height: 10.0,
                                        ),
                                        DropDownField(
                                            icon: new Image.asset("assets/ssd.png", width: 50, height: 50,),
                                            required: false,
                                            hintText: 'How many SSDs',
                                            labelText: 'Solid State Drive',
                                            items: SSDs,
                                            setter: (dynamic newValue) {
                                              formData['SSD'] = newValue;
                                            }),
                                        Divider(
                                          height: 10.0,
                                        ),
                                        DropDownField(
                                            icon: new Image.asset("assets/hdd.png", width: 50, height: 50,),
                                            required: false,
                                            hintText: 'How many HDDs',
                                            labelText: 'Hard Disk Drive',
                                            items: HDDs,
                                            setter: (dynamic newValue) {
                                              formData['HDD'] = newValue;
                                            }),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(00.0, 0.0, 0.0, 0.0),
                                          child:
                                          DropDownField(
                                              value: formData['HDDcount'],
                                              icon: new Image.asset("assets/empty.png", width: 50, height: 30,),
                                              required: false,
                                              hintText: 'How many HDDs',
                                              labelText: 'HDD Count',
                                              items: HDDcount,
                                              setter: (dynamic newValue) {
                                                formData['HDDcount'] = newValue;
                                              }),),
                                        Divider(
                                          height: 10.0,
                                        ),
                                        DropDownField(
                                            icon: new Image.asset("assets/ram.png", width: 50, height: 50,),
                                            required: false,
                                            hintText: 'How many RAM Sticks',
                                            labelText: 'Memory (RAM)',
                                            items: RAM,
                                            itemsVisibleInDropdown: 4,
                                            setter: (dynamic newValue) {
                                              formData['RAM'] = newValue;
                                            }),
                                        Divider(
                                          height: 10.0,
                                        ),
                                        DropDownField(
                                            icon: new Image.asset("assets/optical.png", width: 50, height: 50,),
                                            required: false,
                                            hintText: 'How many Optical Drives',
                                            labelText: 'Optical Drives',
                                            items: Drives,
                                            setter: (dynamic newValue) {
                                              formData['Drives'] = newValue;
                                            }),
                                        Divider(
                                          height: 10.0,
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text("CPU Overclock?"),
                                                Checkbox(
                                                  value: CPUoc,
                                                  onChanged: (bool value) {
                                                    setState(() {
                                                      CPUoc = value;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text("GPU Overclock?"),
                                                Checkbox(
                                                  value: GPUoc,
                                                  onChanged: (bool value) {
                                                    setState(() {
                                                      GPUoc = value;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ]
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(10.0, 0, 20.0, 0),
                                          width: double.infinity,
                                          child: RaisedButton(
                                            onPressed: result,
                                            padding: const EdgeInsets.all(20.0),
                                            child: const Text(
                                                'Calculate!',
                                                style: TextStyle(fontSize: 20)
                                            ),
                                          ),
                                        ),
                                        Container(
                                            decoration: new BoxDecoration(
                                                color: Colors.grey[100],
                                                border: new Border.all(color: Colors.deepOrangeAccent),
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.grey,
                                                    offset: new Offset(.0, 10.0),
                                                    blurRadius: 10.0,
                                                  )
                                                ],
                                            ),
                                            margin: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                                            child:
                                            Container(
                                              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                              child:
                                                Column(
                                                    children: [
                                                      Row(
                                                          children: [
                                                            Text('Load Power Draw: ',
                                                                style: TextStyle(
                                                                  color: Colors.black87,
                                                                  fontSize: 18,
                                                                )),
                                                            Text(wattage.toStringAsFixed(0) + ' W',
                                                                style: TextStyle(
                                                                  color: Colors.red,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.w800,
                                                                )),]),
                                                      const SizedBox(height: 10),
                                                      Row(
                                                          children: [
                                                            Text('Recommended PSU Wattage',
                                                                style: TextStyle(
                                                                  color: Colors.black87,
                                                                  fontSize: 25,
                                                                  fontWeight: FontWeight.w600,
                                                                )),]),
                                                      const SizedBox(height: 10),
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child:
                                                        Text('$rec W',
                                                            style: TextStyle(
                                                              color: Colors.deepOrange,
                                                              fontSize: 50,
                                                              fontWeight: FontWeight.w800,
                                                            )),),
                                                      const SizedBox(height: 10),
                                                      RecommendationWidget(recommended),
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.grey[100],
                                            border: new Border.all(color: Colors.deepOrangeAccent),
                                            boxShadow: [
                                              new BoxShadow(
                                                color: Colors.grey,
                                                offset: new Offset(.0, 10.0),
                                                blurRadius: 10.0,
                                              )
                                            ],
                                          ),
                                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                                          child:
                                          Container(
                                            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                            child:
                                            Column(
                                              children: [
                                                Row(
                                                    children: [
                                                      Text('Peak Power Consumption Breakdown ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),
                                                const SizedBox(height: 10),
                                                Row(
                                                    children: [
                                                      Text('Mobo: ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                          ) ),
                                                      Text(Moboconsumption.toStringAsFixed(0) + ' W',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),
                                                Row(
                                                    children: [
                                                      Text('CPU: ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                          )),
                                                      Text(CPUconsumption.toStringAsFixed(0) + ' W',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),
                                                Row(
                                                    children: [
                                                      Text('GPU: ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                          )),
                                                      Text(GPUconsumption.toStringAsFixed(0) + ' W',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),
                                                Row(
                                                    children: [
                                                      Text('RAM: ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                          )),
                                                      Text(RAMconsumption.toStringAsFixed(0) + ' W',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),
                                                Row(
                                                    children: [
                                                      Text('SSD: ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                          )),
                                                      Text(SSDconsumption.toStringAsFixed(0) + ' W',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),
                                                Row(
                                                    children: [
                                                      Text('HDD: ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                          )),
                                                      Text(HDDconsumption.toStringAsFixed(0) + ' W',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),
                                                Row(
                                                    children: [
                                                      Text('Drives: ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                          )),
                                                      Text(Driveconsumption.toStringAsFixed(0) + ' W',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),
                                                const SizedBox(height: 10),
                                                Row(
                                                    children: [
                                                      Text('Yearly Energy Cost: ',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w700,
                                                          )),
                                                      Text('\$' + powerCost().toStringAsFixed(2),
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w800,
                                                          )),]),


                                                Container(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Row(
                                                      children: [
                                                        Text('Notes: \n'
                                                            'This is just an estimate. Power consumption of individual \ncomponents will vary'
                                                            '\n'
                                                            'Recommended PSU wattage = calulated peak \nwattage * 1.3'
                                                            '\n'
                                                            'RAM power consumption is calculated for \nDDR4/DDR3 based on CPU choice',
                                                            style: TextStyle(
                                                                color: Colors.black54,
                                                                fontSize: 12,
                                                                fontStyle: FontStyle.italic
                                                            ) ),]),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )))),
                      ));
                else
                  return LinearProgressIndicator();
              }
          }
        });
  }

  Future<bool> buildFutures() async {
    return true;
  }

  void result() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _formKey.currentState.save();
      setState(() {
          if (GPUoc) GPUmultiplier = 1.2; else GPUmultiplier= 1.0;
          if (CPUoc) CPUmultiplier = 1.2; else CPUmultiplier = 1.0;
          Moboconsumption = double.parse(Mobodata[formData['mobo']]);
          CPUconsumption = int.parse(CPUdata[formData['CPU']]['TDP']) * CPUmultiplier;
          GPUconsumption = int.parse(GPUdata[formData['GPU']]) * GPUmultiplier* int.parse(formData['GPUcount']);
          RAMconsumption = double.parse(RAMdata[formData['RAM']]);
          if (int.parse(CPUdata[formData['CPU']]['DDR']) == 3) RAMconsumption *= 1.5;
          SSDconsumption = double.parse(SSDdata[formData['SSD']]);
          HDDconsumption = (double.parse(HDDdata[formData['HDD']]) * int.parse(formData['HDDcount']));
          Driveconsumption = double.parse(Drivedata[formData['Drives']]);
/*
          wattage = double.parse(Mobodata[formData['mobo']])
              * (int.parse(GPUdata[formData['GPU']]) * GPUmultiplier* int.parse(formData['GPUcount'])
              + (int.parse(CPUdata[formData['CPU']]) * CPUmultiplier)
              + int.parse(RAMdata[formData['RAM']])
              + int.parse(SSDdata[formData['SSD']])
              + int.parse(Drivedata[formData['Drives']])
              + (int.parse(HDDdata[formData['HDD']]) * int.parse(formData['HDDcount'])));
              */
          wattage = Moboconsumption + CPUconsumption + GPUconsumption + RAMconsumption + SSDconsumption + HDDconsumption + Driveconsumption;
          recommended = (wattage.toDouble() * 1.3);
          rec = recommended.toInt();
      });
    }
  }

  double powerCost() {
    double average;
    average = ((wattage * 8)/1000)*(12/100)*365;
    return average;
  }
}
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class RecommendationWidget extends StatefulWidget {
  RecommendationWidget(this.recommended);
  double recommended;

  @override
  _RecommendationWidgetState createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child:
            Text(recommend(widget.recommended),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),),
          const SizedBox(height: 10),
          FlatButton(
              onPressed: _launchURL,
              padding: EdgeInsets.all(0.0),
              child: SizedBox (
                width: width(widget.recommended),
                height: height(widget.recommended),
                child: Image.asset(image(widget.recommended)),
              )
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child:
            Text(
                text(widget.recommended),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )
            ),
          ),
        ],
      ),
    );
  }
  double width(double x) {
    if (x == 0) return 0.0;
    else return 200.0;
  }
  double height(double x) {
    if (x == 0) return 0.0;
    else return 180.0;
  }
  String recommend(double x) {
    if (x == 0) {
      return '';
    }
    else {
      return 'Power Supply Recommendation';
    }
  }
  String image(double x) {
    if (x == 0) {
      return '';
    }
    if (x < 450) {
      return 'assets/EVGA 450 BT.jpg';
    }
    if (x < 500) {
      return 'assets/EVGA 500 BR.jpg';
    }
    else if (x < 550) {
      return 'assets/Seasonic FOCUS 550 Gold.jpg';
    }
    else if (x < 650) {
      return 'assets/EVGA G3 650.jpg';
    }
    else if (x < 750) {
      return 'assets/EVGA G3 750.jpg';
    }
    else if (x < 850) {
      return 'assets/Seasonic FOCUSplus Platinum 850.jpg';
    }
    else if (x < 1000){
      return 'assets/EVGA G3 1000.jpg';
    }
    else {
      return 'assets/Corsair HX 1200.PNG';
    }
  }

  String text(double x) {
    if (x == 0) {
      return '';
    }
    if (x < 450) {
      return 'EVGA 450 BT';
    }
    if (x < 500) {
      return 'EVGA 500 BR';
    }
    else if (x < 550) {
      return 'Seasonic FOCUS Gold 550';
    }
    else if (x < 650) {
      return 'EVGA SuperNOVA G3 650';
    }
    else if (x < 750) {
      return 'EVGA SuperNOVA G3 750';
    }
    else if (x < 850) {
      return 'Seasonic FOCUS+ Platinum 850';
    }
    else if (x < 1000){
      return 'EVGA SuperNOVA G3 1000';
    }
    else {
      return 'Corsair HX1200 Platinum';
    }
  }
  _launchURL() async {
    String url = 'https://flutter.io';
    if (widget.recommended == 0) {
      url = '';
    }
    if (widget.recommended < 450) {
      url = 'https://amzn.to/2SFZng2';
    }
    if (widget.recommended < 500) {
      url = 'https://amzn.to/2SCn6O2';
    }
    else if (widget.recommended < 550) {
      url = 'https://amzn.to/2LJopdl';
    }
    else if (widget.recommended < 650) {
      url = 'https://amzn.to/311SJUp';
    }
    else if (widget.recommended < 750) {
      url = 'https://amzn.to/2LFMYYU';
    }
    else if (widget.recommended < 850) {
      url = 'https://amzn.to/2LFB0yv';
    }
    else if (widget.recommended < 1000){
      url = 'https://amzn.to/2LI6ynq';
    }
    else {
      url = 'https://amzn.to/2SBbFWQ';
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
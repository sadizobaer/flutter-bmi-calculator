import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class Resultpage extends StatelessWidget {

  Resultpage({this.bmi,this.resultTxt,this.interpretation});

  final String bmi;
  final String resultTxt;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result'),),
      body: Container(
        margin: EdgeInsets.all(10),
        color: activeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text('Your Result:',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: inactiveColor,
                ),),
              ),
            ),
            Expanded(
              flex: 5,
              child: NewContainer(
                colour: inactiveColor,
                cChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultTxt,
                    style: TextStyle(
                      color: Color(0xff24d876),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),
                    Text(bmi,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

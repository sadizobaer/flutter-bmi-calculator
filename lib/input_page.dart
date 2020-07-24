import 'package:bmi_calculator/calculate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result.dart';
import 'calculate.dart';

const activeColor = Color(0xff4c4f5e);
const inactiveColor = Color(0xff1D1E33);
enum gender{
Male,
Female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = gender.Male;
                      });
                    },
                    child: NewContainer(
                      colour: selectedGender == gender.Male ? activeColor : inactiveColor,
                      cChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xffFAE248),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = gender.Female;
                      });
                    },
                    child: NewContainer(
                      colour: selectedGender == gender.Female ? activeColor : inactiveColor,
                      cChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80.0,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xffFAE248),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewContainer(
              colour: inactiveColor,
              cChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Height',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xffFAE248),
                    ),
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(height.toString(),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),),
                      Text('cm',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffFAE248),
                      ),),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 250.0,
                    inactiveColor: Color(0xff8d8e98),
                    activeColor: Color(0xffFAE248),
                    onChanged: (double newVal){
                      setState(() {
                        height = newVal.round();
                      });
                    },

                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Expanded(
                  child: NewContainer(
                    colour: inactiveColor,
                    cChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Weight',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xffFAE248),
                        ),),
                        Text(weight.toString(),
                          style:TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconBtn(
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundIconBtn(
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: NewContainer(
                    colour: inactiveColor,
                    cChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Age',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffFAE248),
                          ),),
                        Text(age.toString(),
                          style:TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconBtn(
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundIconBtn(
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Calculate cal = Calculate(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => Resultpage(
                bmi: cal.calculateBMI(),
                resultTxt: cal.getResult(),
                interpretation: cal.getInterpretation(),
              ),),);
            },
            child: Container(
              child: Center(child: Text('Calculate',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff1D1E33),
              ),),),
              color: Color(0xffFAE248),
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}

class NewContainer extends StatelessWidget {
  NewContainer({this.cChild,this.colour});
  final cChild;
  final colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cChild,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          width: 2.0,
          color: Color(0xffFAE248),
        ),
      ),
    );
  }
}

class RoundIconBtn extends StatelessWidget {

  RoundIconBtn({this.icon,this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: activeColor,
    );
  }
}

import 'dart:math';

class Calculate {
  Calculate({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi = weight.toDouble()/(pow(height.toDouble()/100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi > 24){
      return 'Overweight';
    }
    else if(_bmi >18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have higher than normal body weight so try to exercise more!';
    }
    else if(_bmi >18.5){
      return 'You have normal body weight so good job!';
    }
    else{
      return 'You have lower than normal body weight so try to eat more!';
    }
  }

}
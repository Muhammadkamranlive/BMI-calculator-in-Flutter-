import 'package:flutter/material.dart';
import 'Reuseable.dart';
import 'constants.dart';
class OutPut extends StatelessWidget {
  OutPut(
       {
        required this.interpretation,
        required this.bmiResult,
        required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff11163A),
        title: Text('BMI CALCULATOR',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardContainer(
              colour: ActiveCardColour,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: ResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: BMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: BodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            width: double.infinity,
            height: 60.0,
            child: RaisedButton(
                shape:StadiumBorder(),
                color:bottombuttonColor,
                child: Text('RE-CALCULATE YOUR BMI',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                onPressed: (){

                  Navigator.pop(
                    context,

                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
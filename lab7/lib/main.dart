import 'package:flutter/material.dart';
import 'constants.dart';
import 'Reuseable.dart';
import 'OutPut.dart';
import 'processing.dart';
void main() {
  runApp(BMI());
}


class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(

         scaffoldBackgroundColor: Color(0xff0D1235),
         accentColor:Color(0xffFF0067),

         textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white)
         )


       ),
      home:MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int height=180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff11163A),
        title: Center(child: Text('BMI CALCULATOR',style: TextStyle(fontSize: 20),)),
        leading: Icon(Icons.dehaze_sharp),
      ),
      body:Column(
          
            children: [
              Expanded(
                child: Row(

                  children: [
                    Expanded(
                      child:GestureDetector(
                        onTap: (){

                        },
                        child: CardContainer(
                          colour: activeCardColor,
                          childCard: IconContainer(
                            icon: Icons.male,
                            gender: 'MALE',
                          ),
                        ),
                      ),),
                    Expanded(
                      child:GestureDetector(
                        onTap: (){

                        },
                        child: CardContainer(
                          colour: activeCardColor,
                          childCard:IconContainer(
                            icon: Icons.female,
                            gender: 'FEMALE',
                          ) ,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Expanded(
                child: CardContainer(
                  colour: activeCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: LabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: NumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: LabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),




              Expanded(
                child: Row(
                 children: [
                    Expanded(
                      child:CardContainer(
                      colour:activeCardColor,
                      childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                       'WEIGHT',
                        style: LabelTextStyle,
                      ),
                      Text(
                      weight.toString(),
                      style: NumberTextStyle,
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              elevation: 0.0,
                              child: Icon(Icons.remove),
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                            ),
                            RawMaterialButton(
                              elevation: 0.0,
                              child: Icon(Icons.add),
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                            )
                          ],
                        )
                    ],
                     ),
                    ),),
                    Expanded(
                      child:CardContainer(
                        colour:activeCardColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: LabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: NumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  elevation: 0.0,
                                  child: Icon(Icons.remove),
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  constraints: BoxConstraints.tightFor(
                                    width: 56.0,
                                    height: 56.0,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                ),
                                RawMaterialButton(
                                  elevation: 0.0,
                                  child: Icon(Icons.add),
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  constraints: BoxConstraints.tightFor(
                                    width: 56.0,
                                    height: 56.0,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                )
                              ],
                            )
                          ],
                        ),
                      ) ,),

                  ],
                ),
              ),
               Container(
                 margin: EdgeInsets.only(bottom: 5.0),
                  width: double.infinity,
                  height: 60.0,
                  child: RaisedButton(
                      shape:StadiumBorder(),
                      color:bottombuttonColor,
                      child: Text('CALCULATE YOUR BMI',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                      onPressed: (){
                        //passing the values to the BMICalculator class
                       Processing obj= Processing(height: height, weight: weight);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OutPut(
                              //passing the values to the OutPut class
                              bmiResult: obj.calculateBMI(),
                              resultText: obj.getResult(),
                              interpretation: obj.getInterpretation(),
                            ),
                          ),
                        );
                      }
                   ),
                ),


            ],
          ),);



  }
}



class IconContainer extends StatelessWidget {
  IconContainer({this.icon,this.gender});
  IconData? icon;
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Icon(icon,size: 80.0,color: Colors.white,)),
        SizedBox(height: 20.0,),
        Center(child: Text(gender!,style: TextStyle(color:Colors.white,fontSize:18),),)
      ],
    );
  }
}







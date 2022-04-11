import 'package:flutter/material.dart';
class CardContainer extends StatelessWidget {
  CardContainer({  this.colour,this.childCard});
  Color? colour;
  Widget? childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color:colour  ,
        ),
        child: childCard
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_cup_2022/models/nation.dart';

class CardNation2 extends StatelessWidget {
  CardNation2({super.key, required this.nation});
  final Nation nation;
  @override 
  Widget build(BuildContext context){
    return Card(
      shadowColor: Colors.red,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Padding(  
        padding: EdgeInsets.all(10.0),
        child: FittedBox(
          child: Column(
            children: [
              Image(
                image: NetworkImage(nation.imgURL),
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text(
                nation.name,
                style: TextStyle(  
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      )
    );
  }
} //https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpdwKsrvHVr_zgKDp_NaloQew0VSbrB_IYkA&usqp=CAU
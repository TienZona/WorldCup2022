

import 'package:flutter/material.dart';
import 'package:world_cup_2022/models/Nation.dart';
import '../../models/Stats.dart';

class CardNation extends StatelessWidget {
  const CardNation(
    {
      super.key, 
      required this.nation1, 
      required this.nation2, 
      required this.date, 
      required this.time, 
      required this.team1, 
      required this.team2, 

    }
  );

  final Nation nation1;
  final Nation nation2;
  final String date;
  final String time;
  final Stats team1;
  final Stats team2;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(  
        height: 150,
        child: Card(
          color: Color.fromARGB(255, 5, 62, 62),
          margin: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75.0),
            side: BorderSide(
              color: Color.fromARGB(255, 42, 114, 125),
              width: 2.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Column(
                children:  <Widget>[
                  Card(
                    color: Color.fromARGB(255, 237, 240, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                        color: Color.fromARGB(255, 13, 13, 13),
                        width: 2.0,
                      ),
                    ),
                    
                    child: SizedBox(  
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            nation1.logo,
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            nation1.name,
                          )
                        ],
                      ),
                      
                    )
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: Column(
                  children: [
                    Text(
                      '${date}',
                      style: TextStyle(  
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    Spacer(flex: 2),
                    Text(
                      '${time}',
                      style: TextStyle(  
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${team1.goal}' +' : ' + '${team2.goal}',
                      style: TextStyle(  
                        color: Colors.white,
                        fontSize: 24
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children:  <Widget>[
                  Card(
                    color: Color.fromARGB(255, 237, 240, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                        color: Color.fromARGB(255, 13, 13, 13),
                        width: 2.0,
                      ),
                    ),
                    
                    child: SizedBox(  
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            nation2.logo,
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            nation2.name,
                          )
                        ],
                      ),
                      
                    )
                  ),
                ]
              ),
            ],
          ),
        ),
      );
  }
}
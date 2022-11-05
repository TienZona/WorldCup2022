import 'package:flutter/material.dart';
import '../../models/Match.dart';
import '../../models/Stats.dart';


class DetailMatch extends StatelessWidget {
  const DetailMatch({super.key});

  
  // final Match match;

  @override 
  Widget build(BuildContext context){
    final Match match = Match(
        id_team_1: '1', 
        id_team_2: '2', 
        date: '12-12-2022', 
        time: '12:00', 
        team1: Stats(
          goal: 1,
          shot: 1,
          onTarget: 1,
          possession: 1,
          foul: 1,
          yellowCard: 1,
          redCard: 1
        ),
        team2: Stats(
          goal: 1,
          shot: 1,
          onTarget: 1,
          possession: 1,
          foul: 1,
          yellowCard: 1,
          redCard: 1
        )
      );
    return Scaffold( 
      appBar: AppBar(  
        title: const Text('World Cup 2022'),
      ),
      // drawer: const AppDrawer(),
      body:  TopCard(match),
    );
  } 

  Widget TopCard(Match match){
    return Card(
      margin: EdgeInsets.all(16.0),
      child: SizedBox(
        height: 500,
        child: Padding(  
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 120,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/logo/bi.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Anh',
                              style: TextStyle( 
                                fontSize: 16
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(match.date),
                      SizedBox(height: 10),
                      Text(match.time),
                      SizedBox(height: 10),
                      Text(
                        '${match.team1.goal}   -   ${match.team2.goal}',
                        style: TextStyle(  
                          fontSize: 28
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 120,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/logo/bi.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Anh',
                              style: TextStyle( 
                                fontSize: 16
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Divider(  
                height: 40,
                color: Colors.black,
                indent: 30,
                endIndent: 30,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TEAM STATS',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.team1.shot}'),
                        Text('Số lần sút'),
                        Text('${match.team2.shot}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('16'),
                        Text('Sút trúng đích'),
                        Text('12'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('70%'),
                        Text('Kiểm soát bóng'),
                        Text('30%'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('16'),
                        Text('Phạm lỗi'),
                        Text('12'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('16'),
                        Text('Thẻ vàng'),
                        Text('12'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('16'),
                        Text('Thẻ đỏ'),
                        Text('12'),
                      ],
                    )
                  ],
                ),
              )
              
            ],
          )
        ),
      )
    );
  }

}
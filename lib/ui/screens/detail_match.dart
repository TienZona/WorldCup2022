import 'package:flutter/material.dart';
import 'package:world_cup_2022/ui/managers/nation_manager.dart';
import '../../models/Match.dart';
import '../../models/Stats.dart';


class DetailMatch extends StatelessWidget {
  static const routeName = '/detail_match';

  const DetailMatch({super.key, required this.match, required this.title});


  final Match match;
  final String title;

  @override 
  Widget build(BuildContext context){

    return Scaffold( 
      appBar: AppBar(  
        title: const Text('World Cup 2022'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ), 
      ),
      body:  TopCard(match),
    );
  } 

  Widget TopCard(Match match){
    final nation1 = NationManager().findById(match.t1_id);
    final nation2 = NationManager().findById(match.t2_id);

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
                              nation1.logo,
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              nation1.name,
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
                        '${match.t1_goal}   -   ${match.t2_goal}',
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
                              nation2.logo,
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              nation2.name,
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
                        Text('${match.t1_shot}'),
                        Text('Số lần sút'),
                        Text('${match.t2_shot}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_onTarget}'),
                        Text('Sút trúng đích'),
                        Text('${match.t2_onTarget}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_possession}%'),
                        Text('Kiểm soát bóng'),
                        Text('${match.t2_possession}%'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_foul}'),
                        Text('Phạm lỗi'),
                        Text('${match.t2_foul}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_yellowCard}'),
                        Text('Thẻ vàng'),
                        Text('${match.t2_redCard}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${match.t1_redCard}'),
                        Text('Thẻ đỏ'),
                        Text('${match.t2_redCard}'),
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
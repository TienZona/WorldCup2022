import 'package:flutter/cupertino.dart';
import 'package:world_cup_2022/ui/widgets/card_rating.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen ({super.key});

  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(  
        color: Color.fromARGB(255, 25, 9, 75),
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return CardRating();
        },
      ),
    );
  }
}
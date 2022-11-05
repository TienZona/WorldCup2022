import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 80.0,
      ),
      // transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://i.pinimg.com/originals/ec/82/a5/ec82a51e2d701406118f5d010b7fa0ab.png'),
            fit: BoxFit.cover,
          ),
      ),
      child: Text(
        '',
        style: TextStyle(
          color: Colors.amber,
          fontSize: 30,
          fontFamily: 'Anton',
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

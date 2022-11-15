import 'package:flutter/foundation.dart';

class Nation {
  final String name;
  final String imgURL;


  Nation({
    required this.name,
    required this.imgURL,
  });

  Nation copyWith({
    String? name,
    String? imgURL,
  }) {
    return Nation(
      name: name ?? this.name,
      imgURL: imgURL ?? this.imgURL,
    );
  }

}
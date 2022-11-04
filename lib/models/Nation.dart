import 'package:flutter/foundation.dart';

class Nation {
  final String? id;
  final String name;
  final String logo;


  Nation({
    this.id,
    required this.name,
    required this.logo,
  });

  Nation copyWith({
    String? id,
    String? name,
    String? logo,
  }) {
    return Nation(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

}
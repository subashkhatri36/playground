import 'package:flutter/material.dart';

enum WalkThroughTitleColor {
  blue,
  red,
}
Color walkThroughEnumToColor(String color) {
  switch (WalkThroughTitleColor.values.byName(color)) {
    case WalkThroughTitleColor.blue:
      return Colors.blue;
    case WalkThroughTitleColor.red:
      return Colors.red;
  }
}

class WalkThroughModel {
  String? image;
  String? mapImage;
  String? country;
  String? description;
  String? countryColor;

  WalkThroughModel({
    this.image,
    this.mapImage,
    this.country,
    this.description,
    this.countryColor,
  });
}

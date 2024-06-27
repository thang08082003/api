import 'package:flutter/material.dart';

class DateTimeModel {
  final String titleText;
  final String valueText;
  final IconData iconSection;
  final VoidCallback onTap;

  DateTimeModel({
    required this.titleText,
    required this.valueText,
    required this.iconSection,
    required this.onTap,
  });
}

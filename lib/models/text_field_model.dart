import 'package:flutter/widgets.dart';

class TextFieldModel {
  final String hintText;
  final int maxLine;
  final TextEditingController txtController;

  TextFieldModel({
    required this.hintText,
    required this.maxLine,
    required this.txtController,
  });
}

import 'package:flutter/material.dart';
import 'package:todoapp/models/text_field_model.dart';

class TextFieldWidget extends StatelessWidget {
  final TextFieldModel model;

  const TextFieldWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: model.hintText,
        ),
        maxLines: model.maxLine,
      ),
    );
  }
}

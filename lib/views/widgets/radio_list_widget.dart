import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoapp/models/radio_list_model.dart';
import 'package:todoapp/providers/radio_provider.dart';

class RadioListWidget extends ConsumerWidget {
  const RadioListWidget({
    required this.model,
    required this.onChangeValue,
    super.key,
  });

  final RadioModel model;
  final VoidCallback onChangeValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);

    return Container(
      color: Colors.white,
      child: RadioListTile(
        activeColor: model.cateColor,
        contentPadding: EdgeInsets.zero,
        title: Transform.translate(
          offset: const Offset(-20, 0),
          child: Text(
            model.titleRadio,
            style: TextStyle(
              color: model.cateColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        value: model.valueInput,
        groupValue: radio,
        onChanged: (value) => onChangeValue(),
      ),
    );
  }
}

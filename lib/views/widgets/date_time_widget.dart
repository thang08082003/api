import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoapp/models/date_time_model.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({
    required this.model,
    super.key,
  });

  final DateTimeModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.titleText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Material(
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () => model.onTap(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(model.iconSection),
                    const SizedBox(width: 10),
                    Text(model.valueText),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/models/date_time_model.dart';
import 'package:todoapp/models/radio_list_model.dart';
import 'package:todoapp/models/text_field_model.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/providers/date_time_provider.dart';
import 'package:todoapp/providers/radio_provider.dart';
import 'package:todoapp/providers/service_provider.dart';
import 'package:todoapp/views/widgets/date_time_widget.dart';
import 'package:todoapp/views/widgets/radio_list_widget.dart';
import 'package:todoapp/views/widgets/text_field_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
  AddNewTaskModel({
    super.key,
  });
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
    final timeProv = ref.watch(timeProvider);

    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.82,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            thickness: 1.2,
            color: Colors.grey,
          ),
          const Text(
            'Title Task',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          TextFieldWidget(
            model: TextFieldModel(
              hintText: 'Add Task Name',
              maxLine: 1,
              txtController: titleController,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          TextFieldWidget(
            model: TextFieldModel(
              hintText: 'Add Description',
              maxLine: 5,
              txtController: descriptionController,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: RadioListWidget(
                  model: RadioModel(
                    cateColor: Colors.grey.shade800,
                    titleRadio: 'Learn',
                    valueInput: 1,
                  ),
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioListWidget(
                  model: RadioModel(
                    cateColor: Colors.grey.shade600,
                    titleRadio: 'Work',
                    valueInput: 2,
                  ),
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioListWidget(
                  model: RadioModel(
                    cateColor: Colors.grey.shade400,
                    titleRadio: 'General',
                    valueInput: 3,
                  ),
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 3),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                model: DateTimeModel(
                  iconSection: CupertinoIcons.calendar,
                  titleText: 'Date',
                  valueText: dateProv,
                  onTap: () async {
                    final getValue = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2066),
                    );
                    if (getValue != null) {
                      final format = DateFormat.yMd();
                      ref
                          .read(dateProvider.notifier)
                          .update((state) => format.format(getValue));
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              DateTimeWidget(
                model: DateTimeModel(
                  iconSection: CupertinoIcons.clock,
                  titleText: 'Time',
                  valueText: timeProv,
                  onTap: () async {
                    final getTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (getTime != null) {
                      ref
                          .read(timeProvider.notifier)
                          .update((state) => getTime.format(context));
                    }
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              const Spacer(),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    final getcRadioValue = ref.read(radioProvider);
                    String category = '';
                    switch (getcRadioValue) {
                      case 1:
                        category = 'Leaning';
                        break;
                      case 2:
                        category = 'Working';
                        break;
                      case 3:
                        category = 'General';
                        break;
                    }

                    ref.read(serviceProvider).addNewTask(TodoModel(
                        titleTask: titleController.text,
                        description: descriptionController.text,
                        category: category,
                        dateTask: ref.read(dateProvider),
                        timeTask: ref.read(timeProvider)));
                    print('Data is saving');
                  },
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

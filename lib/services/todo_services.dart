import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/todo_model.dart';

class TodoServices {
  final totoCollection = FirebaseFirestore.instance.collection('todoApp');
  void addNewTask(TodoModel model) {
    totoCollection.add(model.toMap());
  }
}

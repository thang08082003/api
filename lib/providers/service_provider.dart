import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoapp/services/todo_services.dart';

final serviceProvider = StateProvider<TodoServices>((ref) {
  return TodoServices();
});

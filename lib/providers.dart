import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final tasksProvider = StreamProvider<List<Task>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchAllTasks();
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' as drift;
import '../database/app_database.dart';
import '../providers.dart';

class CreateScreen extends ConsumerWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Tarea')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Escribe tu tarea aquí...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('GUARDAR TAREA'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                if (titleController.text.isNotEmpty) {
                  await ref
                      .read(databaseProvider)
                      .insertTask(
                        TasksCompanion(
                          title: drift.Value(titleController.text),
                        ),
                      );

                  if (context.mounted) {
                    context.pop();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Escribe algo primero')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

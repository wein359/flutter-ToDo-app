import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/firestore_service.dart';
import '../widgets/todo_dialog.dart';
import '../widgets/todo_item.dart';

class TodoScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();
  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: StreamBuilder<List<Todo>>(
        stream: _firestoreService.getTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Belum ada tugas.'));
          }
          final todos = snapshot.data!;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                todo: todos[index],
                firestoreService: _firestoreService,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
                TodoDialog(firestoreService: _firestoreService),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
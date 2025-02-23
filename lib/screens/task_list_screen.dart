import 'package:flutter/material.dart';
import '../models/task.dart';
import '../helpers/database_helper.dart';
import 'task_detail_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    setState(() => isLoading = true);
    final loadedTasks = await _databaseHelper.getTasks();
    setState(() {
      tasks = loadedTasks;
      isLoading = false;
    });
  }

  Future<void> _addTask() async {
    final newTask = await Navigator.push<Task>(
        context, MaterialPageRoute(builder: (context) => const TaskDetailScreen()));
    if (newTask != null) {
      await _databaseHelper.insertTask(newTask);
      await _loadTasks();
    }
  }

  Future<void> _editTask(int index) async {
    final task = tasks[index];
    final editedTask = await Navigator.push<Task>(
        context, MaterialPageRoute(builder: (context) => TaskDetailScreen(task: task)));
    if (editedTask != null) {
      await _databaseHelper.updateTask(editedTask.copyWith(id: task.id));
      await _loadTasks();
    }
  }

  Future<void> _deleteTask(int index) async {
    await _databaseHelper.deleteTask(tasks[index].id!);
    await _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today workes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : tasks.isEmpty
              ? const Center(
                  child: Text('No tasks yet', style: TextStyle(fontSize: 18, color: Colors.grey)),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        title: Text(tasks[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Date: ${tasks[index].date}',
                            style: const TextStyle(color: Colors.black54)),
                        onTap: () => _editTask(index),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => _deleteTask(index),
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

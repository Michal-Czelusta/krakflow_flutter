import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  List<Task> tasks = [
    Task(title: "Sprawdzian", deadline: "jutro"),
    Task(title: "Silownia", deadline: "dzisiaj"),
    Task(title: "Impreza", deadline: "w tym tygodniu"),
    Task(title: "Wakacje", deadline: "w wakacje"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(


        child: Column(
          children: [
            Text("Dzisiejsze zadania",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskCard(
                    title: task.title,
                    subtitle: "termin: ${task.deadline}",
                    icon: Icons.radio_button_unchecked,
                  );
                },
              ),
            ),
          ],
        ),




      ),
    );
  }
}

class Task {
  final String title;
  final String deadline;
  Task({required this.title, required this.deadline});
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}



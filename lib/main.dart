import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {

  List <Task> tasks = [
    Task(title: "Siłownia", deadline: "Dzisiaj", done: true, priority: "Wysoki",),
    Task(title: "Nauka", deadline: "Jutro", done: true, priority: "Średni",),
    Task(title: "Wakacje" ,deadline: "Za pół roku",done: false, priority: "Niski",),
    Task(title: "Swięta" ,deadline: "Za miesiąc",done: false, priority: "Niski",),
  ];

  @override
  Widget build(BuildContext context) {

    int doneCount = 0;
    for (var task in tasks) {
      if (task.done) doneCount++;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("KrakFlow"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Masz dziś ${tasks.length} zadania"),
              Text("Wykonane zadania: ${doneCount}/${tasks.length}"),
              SizedBox(height: 16),
              Text(
                "Dzisiejsze zadania",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context,index) {
                      return Column(
                        children: [
                          TaskCard(
                            title: tasks[index].title,
                            subtitle: "Termin: ${tasks[index].deadline} | Priorytet: ${tasks[index].priority}",
                            icon: tasks[index].done ? Icons.check_circle : Icons.radio_button_unchecked,
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  final String title;
  final String deadline;
  final bool done;
  final String priority;
  Task({
    required this.title,
    required this.deadline,
    required this.done,
    required this.priority,
  });
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






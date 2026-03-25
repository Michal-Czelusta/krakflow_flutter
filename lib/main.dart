import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {

  List <Task> tasks = [
    Task(title: "Siłownia",deadline: "Dzisiaj"),
    Task(title: "Nauka" ,deadline: "Jutro"),
    Task(title: "Wakacje" ,deadline: "Za pół roku"),
    Task(title: "Swięta" ,deadline: "Za miesiąc"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("KrakFlow"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              Text(
                "Dzisiejsze zadania",
                style: TextStyle(
                    fontSize: 22,
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
                            subtitle: tasks[index].deadline,
                            icon: Icons.assignment,
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






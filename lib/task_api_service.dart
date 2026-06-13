import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'task_repository.dart';

class TaskApiService {
  static const String baseUrl = "https://dummyjson.com";

  static Future<List<Task>> fetchTasks() async {
    final url = Uri.parse("$baseUrl/todos");
    log("Wysyłanie zapytania: $url", name: "TaskApiService");

    final response = await http.get(url);
    log("Kod odpowiedzi HTTP: ${response.statusCode}", name: "TaskApiService");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List todos = data["todos"];
      log("Pobrano ${todos.length} zadań", name: "TaskApiService");

      return todos.map((todo) {
        return Task(
          id: todo["id"],
          title: todo["todo"],
          deadline: "brak",
          done: todo["completed"],
          priority: "średni",
        );
      }).toList();
    } else {
      log(
        "Nie udało się pobrać zadań",
        name: "TaskApiService",
        error: "Status: ${response.statusCode}",
      );
      throw Exception("Błąd pobierania danych");
    }
  }
}
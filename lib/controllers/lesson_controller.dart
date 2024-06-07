import 'dart:convert';

import 'package:todo/models/lesson.dart';
import 'package:http/http.dart' as http;

class LessonController {
  String curseId;
  LessonController(String this.curseId);

  List<Lesson> _list = [];

  Future<List<Lesson>> getLessons() async {
    List<Lesson> lessons = [];
    final uri = Uri.parse("https://todo-2a867-default-rtdb.firebaseio.com/lessons.json");
    final respons = await http.get(uri);
    Map<String, Map> datas = jsonDecode(respons.body);
    datas.forEach((key, value) {
      final lesson = Lesson(id: key, courseId: curseId, description: value['description'], quizes: value['quizes'], title: value['title'], videoUrl: value['videoUrl']);
      lessons.add(value)
    });
  }
}

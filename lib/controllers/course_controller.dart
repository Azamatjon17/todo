import 'dart:convert';

import 'package:todo/models/course.dart';
import 'package:http/http.dart' as http;

class CourseController {
  List<Course> _list = [];
  List<Course> get list => [..._list];

  Future<List<Course>> getCourse() async {
    List<Course> courses = [];
    final uri = Uri.parse("https://todo-2a867-default-rtdb.firebaseio.com/courses.json");
    final respons = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(respons.body);
    data.forEach((key, value) {
      Course(
        id: key,
        title: value['title'],
        description: value['description'],
        lessons: value['lessons'],
        imageUrl: value['imageUrl'],
      );
    });

    return courses;
  }
}

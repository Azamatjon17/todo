import 'dart:convert';
import 'package:todo/models/course.dart';
import 'package:http/http.dart' as http;
import 'package:todo/models/lesson.dart';
import 'package:todo/models/quizes.dart';

class CourseController {
  List<Course> _list = [];
  List<Course> get list => [..._list];

  Future<List<Course>> getCourse() async {
    List<Course> courses = [];
    final uri = Uri.parse("https://todo-2a867-default-rtdb.firebaseio.com/courses.json");
    final response = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(response.body);

    for (var entry in data.entries) {
      String key = entry.key;
      var value = entry.value;

      List<Lesson> lessons = await getLessonByCourseId(key);

      Course course = Course(
        id: key,
        title: value['title'],
        description: value['description'],
        lessons: lessons,
        imageUrl: value['imageUrl'],
      );

      courses.add(course);
    }

    _list = courses;
    return courses;
  }

  Future<List<Lesson>> getLessonByCourseId(String courseId) async {
    List<Lesson> lessons = [];
    final uri = Uri.parse("https://todo-2a867-default-rtdb.firebaseio.com/lessons.json");
    final response = await http.get(uri);
    Map<String, dynamic> datas = jsonDecode(response.body);

    for (var entry in datas.entries) {
      String key = entry.key;
      var value = entry.value;

      if (value['courseId'] == courseId) {
        Lesson lesson = Lesson(
          id: key,
          courseId: value['courseId'],
          description: value['description'],
          quizes: [
            Quiz(id: "id", question: "question", options: ["options"], correctOptionIndex: 1)
          ],
          title: value['title'],
          videoUrl: value['videoUrl'],
        );

        lessons.add(lesson);
      }
    }

    return lessons;
  }
}

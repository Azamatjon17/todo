import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/models/course.dart';

class FavoruteCourseController {
  addFavoriteCourse(Course course, String userId) async {
    final url = Uri.parse("https://todo-2a867-default-rtdb.firebaseio.com/favourite.json");
    await http.post(url,
        body: jsonEncode({
          "courseId": course.id,
          "userId": userId,
        }));
  }

  static getFavoriteByUserId(String userId) async {
    final url = Uri.parse('https://todo-2a867-default-rtdb.firebaseio.com/favourite.json?orderBy="userId"&equlTo="$userId"');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;
  }
}

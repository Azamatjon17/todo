import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/models/course.dart';

class FavoruteCourseController {
  addFavoriteCourse(Course course, String userId) async {
    final url = Uri.parse('https://todo-2a867-default-rtdb.firebaseio.com/favourite.json');
    await http.post(url,
        body: jsonEncode({
          "courseId": course.id,
          "userId": userId,
        }));
  }

  deleteFavoruite(Course course, String userId) async {
    final response = await http.get(Uri.parse("https://todo-2a867-default-rtdb.firebaseio.com/favourite.json"));
    Map<String, dynamic> data = jsonDecode(response.body);
    String delateItem;
    data.forEach((key, value) {
      if (value["courseId"] == course && value["userId"] == userId) {
        delateItem = key;
      }
    });
    await http.delete(Uri.parse("https://todo-2a867-default-rtdb.firebaseio.com/favourite/$delateItem.json"));
  }

  static getFavoriteByUserId(String userId) async {
    final url = Uri.parse('https://todo-2a867-default-rtdb.firebaseio.com/favourite.json?orderBy="userId"&equlTo="$userId"');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;
  }
}

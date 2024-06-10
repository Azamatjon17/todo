import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CheckUserServes {
  Future<void> register(String email, String password, String qure) async {
    final url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:$qure?key=AIzaSyB1lxLNMlOZ7x05tU2TrdUyiFNZ_Elpp0Q");
    final response = await http.post(url,
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    final data = jsonDecode(response.body);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final tokenTime = await sharedPreferences.setString(
        "tokenTime",
        DateTime.now()
            .add(
              Duration(
                seconds: int.parse(
                  data['expiresIn'],
                ),
              ),
            )
            .toString());
  }
}

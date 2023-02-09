import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  static const String email = 'trinhhoailinh201@gmail.com';
  static const String password = 'linh2002';
}

Future<String> login() async {
  final response = await http.post(
    Uri.parse('http://api.cup2022.ir/api/v1/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': User.email,
      'password': User.password,
    }),
  );
  if (response.statusCode == 200) {
    return getToken(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

String getToken(Map<String, dynamic> json) {
  final token = json['data'] as Map<String, dynamic>;
  return token["token"] as String;
}

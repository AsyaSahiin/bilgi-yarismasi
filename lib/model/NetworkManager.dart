import 'dart:convert';

import 'package:bilgiyarismasi/model/question.dart';
import 'package:http/http.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init();

  Future<Question?> getQuestions() async {
    var response = await get(
        Uri.parse("https://www.opentdb.com/api.php?amount=20&type=multiple"));
    if (response.statusCode == 200) {
      return Question.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}

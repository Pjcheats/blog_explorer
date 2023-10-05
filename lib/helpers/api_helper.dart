import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {

  static Future<dynamic> callGetApi(String url, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to load api data");
      }
    } catch (e) {
      return null;
    }
  }
}
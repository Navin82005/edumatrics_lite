import 'package:edumatrics_lite/configs/config.app.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<Map> getInternalMarks(int semester) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString("access");
  try {
    final response = await http.get(
      Uri.parse(
        "${AppConfig.backendUrl}/results/marks/$semester/iit/${int.parse(prefs.getString("registerNumber")!)}/",
      ),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)["data"];
      print("actions.internals.getInternals: $result");
      if (result[0]["status"] == 200) {
        return result[1];
      }
    }
  } catch (e) {
    return {"status": "Failed"};
  }
  return {"status": "Failed"};
}

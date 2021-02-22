import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tasklist/constants/api_path.dart';

class GlobalActions {

  static Future<void> loadTaskLists() async {
    return await http.get(
      "$API_ROOT/user/tasklists",
      headers: <String,String> {
        HttpHeaders.authorizationHeader: "Bearer $API_KEY"
      }
    );
  }

  static Future<void> createNewTaskList(String name) async {
    return await http.post(
      "$API_ROOT/tasklist/new",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $API_KEY"
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );
  }
}


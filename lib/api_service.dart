/*

import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  final url = "https://jsonplaceholder.typicode.com/posts";
  var _postJson = [];


  Future<List> fetchPosts() async {
    final response = await get(Uri.parse(url));
    final jsonData = jsonDecode(response.body) as List;
    _postJson = jsonData;

    return _postJson;
  }
}*/

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:learn_riverpod/models/photo_model.dart';

List<PhotoModel> parsePhotos(String responseBody) {
  var tmp = json.decode(responseBody) as List<dynamic>;
  List<PhotoModel> photos =
      tmp.map((model) => PhotoModel.fromJson(model)).toList();
  return photos;
}

Future<List<PhotoModel>> fetchPhotos() async {
  final response = await http
      .get('https://jsonplaceholder.typicode.com/photos')
      .timeout(Duration(seconds: 10));
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception('Cannot fetch');
  }
}

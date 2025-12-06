import 'dart:convert';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  // get method
  Future<List<dynamic>> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("status code is ${response.statusCode}");
    }
  }

  // post method
  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {'Accept': 'application/json'};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    return response;
  }

  // put method
  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("status code is ${response.statusCode}");
    }
  }

  // post method with media
  Future<http.StreamedResponse> multiPartRequest({
    required String url,
    required Map<String, dynamic> fields,
    required Map<String, dynamic> files,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Accept'] = 'application/json';
    request.headers['X-Requested-With'] = 'XMLHttpRequest';

    fields.forEach((key, value) => request.fields[key] = value);
    files.forEach(
      (key, value) async =>
          request.files.add(await http.MultipartFile.fromPath(key, value)),
    );
    http.StreamedResponse response = await request.send();
    return response;
  }
}

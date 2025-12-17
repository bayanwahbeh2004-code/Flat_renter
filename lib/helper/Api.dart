import 'dart:convert';
import 'dart:io';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  // get method
  Future<http.Response> get({required String url, String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  // post method
  Future<http.Response> post({
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
  Future<http.Response> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    return response;
  }

  // delete method
  Future<http.Response> del({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {'Accept': 'application/json'};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    return response;
  }

  // post method with media
  Future<http.StreamedResponse> multiPartRequest({
    String? method,
    required String url,
    required Map<String, dynamic> fields,
    required Map<String, dynamic> files,
    String? token,
  }) async {
    var request = http.MultipartRequest(method ?? 'POST', Uri.parse(url));
    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
    }
    request.headers['Accept'] = 'application/json';
    request.headers['X-Requested-With'] = 'XMLHttpRequest';
    request.fields.addAll(Map<String, String>.from(fields));
    for (var entry in files.entries) {
      if (entry.value != null && entry.value is String) {
        var filePath = entry.value as String;
        var file = File(filePath);
        if (await file.exists()) {
          request.files.add(
            await http.MultipartFile.fromPath(entry.key, filePath),
          );
        }
      }
    }
    http.StreamedResponse response = await request.send();
    return response;
  }
}

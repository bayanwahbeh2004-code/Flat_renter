import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File> fileFromImageUrl(String url) async {
  final response = await http.get(Uri.parse(url));
  final tempDir = await getTemporaryDirectory();
  final fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
  final filePath = '${tempDir.path}/$fileName';
  final file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return file;
}

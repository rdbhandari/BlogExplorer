import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Hive/blogs.dart';
import '../Hive/boxes.dart';

Future<bool> fetchBlogs() async {
  const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  const String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
  try {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)["blogs"];
      for (var blog in data) {
        boxBlogs.put(
            blog["id"],
            Blogs(
                blogId: blog["id"],
                title: blog["title"],
                imgUrl: blog["image_url"],
                isFavorite: false));
      }
    } else {
      print('Request failed with status code: ${response.statusCode}');
      print('Response data: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
  return true;
}

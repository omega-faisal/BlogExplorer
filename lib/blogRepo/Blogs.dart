import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:blogapp/models/Article_models.dart';

class Blogs {
  List<ArticleModels> articles = [];

  Future<void> fetchBlogs() async {
    final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
    try {
      final response = await get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });
      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        var blogs = jsonDecode(response.body);
        blogs['blogs'].forEach((element) {
          if(element['image_url']!=null) {
            ArticleModels articleModel = ArticleModels(
                imageUrl: element['image_url'],
                title: element['title']);
            articles.add(articleModel);
          }
        });
      }
      else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
    }
  }
}

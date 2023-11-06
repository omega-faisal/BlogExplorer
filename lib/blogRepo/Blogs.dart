import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:blogapp/models/Article_models.dart';

class Blogs {
  List<ArticleModels> articles = [];

  Future<void> fetchBlogs() async {
    const String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b0cb4e3ec3e4416a9ebd302e0a7b0ce1';
    Response response = await get(Uri.parse(url));
   try{
      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        var blogs = jsonDecode(response.body);
        blogs['articles'].forEach((element) {
          if (element['urlToImage'] != null) {
            ArticleModels articleModel = ArticleModels(
                imageUrl: element['urlToImage'], title: element['title'],
            newsUrl: element['url']);
            articles.add(articleModel);
          }
        });
      } else {
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

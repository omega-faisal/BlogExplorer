import 'package:blogapp/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:blogapp/Views/article_view.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=>const Home(),
        '/article_view':(context)=>const Blogshow()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

import 'package:blogapp/Views/article_view.dart';
import 'package:blogapp/models/Article_models.dart';
import 'package:blogapp/models/category_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:blogapp/blogRepo/Blogs.dart';
import 'package:blogapp/categorylist.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModels> articles = [];
  List<categorymodels> categories = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    categories = getcategories();
    getBlog();
  }

  getBlog() async {
    Blogs blogsclass = Blogs();
    await blogsclass.fetchBlogs();
    articles = blogsclass.articles;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .sizeOf(context)
        .width * 1;
    final height = MediaQuery
        .sizeOf(context)
        .height * 1;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BLog', style: TextStyle(color: Colors.black)),
                Text('Explorer', style: TextStyle(color: Colors.blueAccent))
              ],
            ),
          ),
        ),
        body: loading
            ? Container(
          child: const Center(
            child: SpinKitCubeGrid(
              color: Colors.blueAccent,
              size: 50.0,
            ),
          ),
        )
            : SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [

                ///Categories
                Container(
                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageurl: categories[index].imageurl,
                        categoryName: categories[index].categoryName,
                      );
                    },
                  ),
                ),

                ///Blogs
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Blogtile(
                          title: articles[index].title,
                          imageurl: articles[index].imageUrl);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.imageurl,
    required this.categoryName,
  });

  final String imageurl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('inkwell 1 worked');
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageurl,
                  width: 120,
                  height: 70,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Blogtile extends StatelessWidget {
  const Blogtile({super.key, required this.title, required this.imageurl});

  final String title;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    bool click = false;

    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print('gesture 02 worked');
        }
        Navigator.pushNamed(context, '/article_view',arguments: {
          'title':title,
          'imageurl':imageurl
        });
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
              children: [
          Container(
          child: Stack(children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageurl,
            width: 400,
            height: 200,
            fit: BoxFit.cover,
          )),
      Positioned(
          bottom: 3,
          right: 10,
          child:IconButton(onPressed: (){
            //todo implement favorite operation..
          }, icon: Image.asset('icons/favorite_icon.png',height: 40,))
      )
    ]),
    ),
    SizedBox(height: 5),
    Text(
    title,
    style: const TextStyle(
    color: Colors.black87,
    fontSize: 16,
    fontWeight: FontWeight.w500),
    textAlign: TextAlign.left,
    )
    ]
    ,
    )
    ,
    )
    ,
    );
  }
}

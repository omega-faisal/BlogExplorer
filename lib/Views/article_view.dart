import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Blogshow extends StatefulWidget {
  @override
  State<Blogshow> createState() => _BlogshowState();

  const Blogshow({super.key});
}

class _BlogshowState extends State<Blogshow> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty
          ? data
          : ModalRoute.of(context)!.settings.arguments as Map;
      // here we are saying first check if the data map is empty and if it is so then assign it as Modal route..
      // and if its not empty and has been set in the set state method then assign it equal to the old value
      // which we have set in the set state function..
    } catch (e) {
      data = data;
    }
    String title = data['title'];
    String imageurl = data['imageurl'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black87,
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
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
      body: Center(
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Container(
                    height: 200,
                    width: 500,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageurl,
                          fit: BoxFit.cover,
                        ))),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'description :',
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 5,
                ),
                const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras blandit mattis magna id vulputate. Nulla at risus sed est finibus semper cursus non erat. Sed ante nibh, ornare a dignissim vel, viverra id purus. Integer id ligula blandit, dictum leo a, feugiat diam. Ut placerat mi ac arcu tristique molestie. Vivamus quis condimentum metus, ut convallis nulla. Etiam pharetra, dui id ornare ullamcorper, lectus velit mattis risus, cursus luctus lectus lorem eu leo. Sed congue fermentum erat, id sagittis lacus maximus vitae. Suspendisse semper vitae nisi id luctus. Aliquam ac imperdiet nunc. Nulla pellentesque interdum risus a pharetra. Cras tellus orci, ultrices at aliquam non, euismod quis velit. Aenean volutpat eleifend sem, eget interdum eros sollicitudin vel. Vestibulum orci enim, gravida non venenatis id, tincidunt nec urna. Etiam sed finibus tortor, id volutpat mi. Nullam rutrum ac ligula sit amet porttitor.Donec luctus, mi eget ornare suscipit, ligula odio tempus urna, id consectetur lectus leo ac metus. Aenean faucibus ullamcorper metus et convallis. Quisque consequat cursus arcu ac aliquam. Nulla id ligula vitae leo pellentesque placerat. In et lacus sed augue'),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon:Image.asset('icons/heart_icon.png', height: 40),
                          color: Colors.red,
                          onPressed: () {
                            //Todo implement like functionality;
                          }),
                      IconButton(
                          icon:Image.asset('icons/save_icon.png', height: 25),
                          color: Colors.red,
                          onPressed: () {
                            //Todo implement save functionality;
                          }),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

//       body: InAppWebView(
//         initialUrlRequest: URLRequest(url: Uri.parse(url)),
//         onWebViewCreated: (InAppWebViewController controller) {
//           inAppWebViewController=controller;
//         },
//         onProgressChanged: (InAppWebViewController controller,int progress)
//         {
//           setState(() {
//             _progress =progress/100;
//           });
//         },
//       ));

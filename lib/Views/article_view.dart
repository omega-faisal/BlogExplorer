import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Blogshow extends StatefulWidget {
  @override
  State<Blogshow> createState() => _BlogshowState();

  const Blogshow({super.key});
}

class _BlogshowState extends State<Blogshow> {
  Map data = {};

  double _progress=0.0;
  late InAppWebViewController inAppWebViewController;

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
    String url=data['newsUrl'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
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
      body:Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(url)),
            onWebViewCreated: (InAppWebViewController controller) {
              inAppWebViewController=controller;
            },
            onProgressChanged: (InAppWebViewController controller,int progress)
            {
              setState(() {
                _progress =progress/100;
              });
            },
          ),
          (_progress<0.5) ? Container(
            child:const Center(child: SpinKitWaveSpinner(color: Colors.blueAccent)),
          ):
              const SizedBox(height: 0,)
        ],
      )
    );
  }
}

     
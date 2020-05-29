import 'dart:async';

import 'package:Youtube_Spam/resource/fake_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListCommentsPage extends StatefulWidget {
  @override
  _ListCommentsPageState createState() => _ListCommentsPageState();
}

class _ListCommentsPageState extends State<ListCommentsPage> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "http://127.0.0.1:1998/",
    );
    return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(5, (index) {
              return itemComment(listTextTest[index]);
            }),
          ),
//        child: ListView.builder(
//            shrinkWrap: true,
//            itemCount: 20,
//            itemBuilder: (BuildContext buildContext, int index,){
//              Future.delayed(Duration(seconds: 2));
//              return itemComment(index.toString());
//            },
//        ),
//      child: ListView(
//        shrinkWrap: true,
//        children: List.generate(20, (index) {
//          Duration(seconds: 10);
//          return itemComment(index.toString());
//        }),
//      ),
    );
  }
  Widget itemComment(String item){
    return Container(
      child: Text(item),
    );
  }
}

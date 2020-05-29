import 'package:Youtube_Spam/model/result.dart';
import 'package:Youtube_Spam/page/page_home.dart';
import 'package:Youtube_Spam/page/page_list_comments.dart';
import 'package:Youtube_Spam/page/page_testing.dart';
import 'package:Youtube_Spam/repo/repo_api.dart';
import 'package:flutter/material.dart';

class YoutubeSpamPage extends StatefulWidget {
  @override
  _YoutubeSpamPageState createState() => _YoutubeSpamPageState();
}

class _YoutubeSpamPageState extends State<YoutubeSpamPage> {

  List<Widget> _list = [
    PageHome(),
    PageMain()
  ];
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Youtube Spam"),
      ),

      body:_list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Testing')
          )
        ],
      )
    );
  }

}

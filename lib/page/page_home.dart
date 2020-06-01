import 'package:Youtube_Spam/model/algorithm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final List<String> listName = [
    'Nguyễn Đức Nguyện',
    'Phan Đăng Lâm',
    'Nguyễn Đình Vinh',
    'Lê Quang Hưng',
    'Lê Thạch Lâm'
  ];
  final List<String> listMSSV=[
    '16520843',
    '16521710',
    '16521582',
    '16520473',
    '16521516'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50,),
          Container(
            child: Text('Khai thác dữ liệu và ứng dụng',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text('CS313.K21',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 100,
            child: Image.asset('fire1.png', fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('GVHD: Cô Nguyễn Thị Anh Thư'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: MediaQuery.of(context).size.width*0.6,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2
              )
            ),
              child: Text('Group 5 - Fire', style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold
              ),)
          ),
          Text("Thành viên",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          buildMembers(),
          buttonConfig(context)
        ],
      ),
    );
  }

  Widget buildMembers(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: List.generate(5, (index) {
              return Container(
                height: 30,
                child: Row(
                  children: <Widget>[
                    index == 4? Icon(Icons.card_membership, size: 18,):
                    Icon(Icons.person, size: 18,),
                    SizedBox(width: 10),
                    Text(listName[index]),
                  ],
                ),
              );
            }),
            crossAxisAlignment: CrossAxisAlignment.start,

          ),
          Column(
            children: List.generate(5, (index) {
              return Container(
                alignment: Alignment.center,
                height:30,
                child: Text(listMSSV[index]),
              );
            }),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
  
  Widget buttonConfig(BuildContext context){
    return Consumer<Algorithm>(
      builder: (context, value, child){
        return OutlineButton(
          color: Colors.white,
          onPressed: (){
            Navigator.pushNamed(context, '/config');
          },
          child: Text("Config"),
        );
      },
    );
  }
}

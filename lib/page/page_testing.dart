import 'package:flutter/material.dart';
import 'package:Youtube_Spam/repo/repo_api.dart';
import 'package:Youtube_Spam/model/result.dart';
import 'dart:async';

class PageMain extends StatefulWidget {
  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  ApiRepo apiRepo;
  int intResult;
  String text="";
  Future<Result> result;
  TextEditingController editingController;
  int algo ;
  @override
  void initState() {
    editingController = TextEditingController();
    apiRepo = ApiRepo(urlApi: "http://192.168.43.239:1998/");
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleGroup(),
            formInputTest(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buttonSend(),
                buildChoice()
              ],
            ),
            buildPopupMenu(),
            resultWidget()
          ],
        ),
      ),
    );
  }

  Widget buildChoice() {
    return PopupMenuButton<int>(
      child: buttonChoice(),
      onSelected: (int value) {
        setState(() {
          algo = value;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 0,
          child: Text('LSTM Algorithm'),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text('Naive - Bayes'),
        ),
      ],
    );
  }
  Widget buildPopupMenu() {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        setState(() {
          editingController.text = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'LIKE THIS COMMENT IF YOU ARE WATCHING.',
          child: Text('Example1 - Spam'),
        ),
        const PopupMenuItem<String>(
          value: 'Such a shame that this song didnt reach 1B in 10 years',
          child: Text('Example2 - NoSpam'),
        ),
        const PopupMenuItem<String>(
          value: 'I just remembered the song because of Alvin',
          child: Text('Example3 - NoSpam'),
        ),
        const PopupMenuItem<String>(
          value: 'Take a look at this video on YouTube',
          child: Text('Example4 - Spam'),
        ),
      ],
    );
  }
  Widget buttonSend(){
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      width: MediaQuery.of(context).size.width*0.3,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        onPressed: ()async{
          setState(() {
            intResult = null;
          });
          text = editingController.value.text;
          if(algo == 0)  {

            apiRepo.getResultLSMT(text).then((value) {
              setState(() {
                intResult = value.result;
              });
            });
          }else{
            apiRepo.getResultNP(text).then((value){
              setState(() {
                intResult = value.result;
              });
            });
          }
        },
        child:Row(
          children: <Widget>[
            Text("Send     ", style: TextStyle(color: Colors.white),),
            Icon(Icons.send, color: Colors.white,)
          ],
        ),
      ),
    );
  }
  Widget buttonChoice(){
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.2),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*0.3,
      height: 35,
      child: Container(
//        color: Theme.of(context).primaryColor,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(algo == 0? "LTMS": "NP" , style: TextStyle(color: Colors.black),),
            Icon(Icons.bubble_chart, color: Colors.black,)
          ],
        ),
      ),
    );
  }
  Widget titleGroup(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Text("Group 5 - Fire ", style: TextStyle(
            fontSize: 15,
          ),
          ),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('fire1.png', fit: BoxFit.fill,)
          )
        ],
      ),
    );
  }
  Widget formInputTest(){
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor)
      ),
      child: TextFormField(
        decoration: new InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:EdgeInsets.all(8),
            hintText: "Typing ..."),
        controller: editingController,
        textInputAction:TextInputAction.done ,
        maxLines: 3,
      ),
    );
  }
  // Truyền kết quả vào
  Widget resultWidget(){
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 50,
      width: MediaQuery.of(context).size.width* 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor
          )
      ),
      child: Container(
          padding: EdgeInsets.all(15),
          child: checkResult()
      ),
    );
  }

  Widget checkResult(){
    if(intResult == null){
      return Text("...");
    }
    if(intResult == 0){
      return Text("SPAM");
    }else{
      return Text("NO SPAM");
    }
  }
}


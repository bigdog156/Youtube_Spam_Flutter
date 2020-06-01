import 'package:Youtube_Spam/model/algorithm.dart';
import 'package:Youtube_Spam/widgets/dropdown_basic.dart';
import 'package:Youtube_Spam/widgets/dropdown_button.dart';
import 'package:Youtube_Spam/widgets/title_group.dart';
import 'package:flutter/material.dart';
import 'package:Youtube_Spam/repo/repo_api.dart';
import 'package:Youtube_Spam/model/result.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class PageMain extends StatefulWidget {
  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  ApiRepo apiRepo;
  int intResult;
  String text="";
  Result proResult;
  TextEditingController editingController;
  String preProcess;
  @override
  void initState() {
    editingController = TextEditingController();
    apiRepo = ApiRepo(urlApi: "http://127.0.0.1:1998/");
    // TODO: implement initState
    preProcess = '';
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    apiRepo = ApiRepo(urlApi: Provider.of<Algorithm>(context).url);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    editingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TitleGroup(),
              formInputTest(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropDownButtonAlgorithm(),
                  buttonSend(),
                ],
              ),
              buildPopupMenu(),
              resultWidget(),
              SizedBox(height: 20,),
              Divider(),
              Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Text("Preprocessing", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ),
              buildDropdown(context),
              preProcessing(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildDropdown(BuildContext context){
    List<String> _items = ['Clean Text','Tokenization','Lemmatization','Vector'];
    return Container(
      child: Consumer<Algorithm>(
        builder: (context, item, child){
          return DropDownBasic(
            value: item.preProcessText,
            items: _items,
            stringCallback: (String newValue){
              setState(() {
                item.changePreProcessText(newValue);
                if( newValue == "Clean Text"){
                  preProcess = proResult.standardize;
                }else if(newValue == 'Tokenization'){
                  preProcess = proResult.tokens;
                }else if (newValue == 'Lemmatization'){
                  preProcess = proResult.lenmatizer;
                }else{
                  preProcess = proResult.vector;
                }
              });
            },
          );
        }
      ),
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
          value: "hey guys!! visit my channel pleaase (i'm searching a dream), https://www.youtube.com/watch?, nanidefk@gmail.com, 888.888.8888, 100.000 ",
          child: Text('Example1'),
        ),
        const PopupMenuItem<String>(
          value: 'Such a shame that this song didnt reach 1B in 10 years',
          child: Text('Example2'),
        ),
        const PopupMenuItem<String>(
          value: 'I just remembered the song because of Alvin',
          child: Text('Example3'),
        ),
        const PopupMenuItem<String>(
          value: 'Take a look at this video on YouTube',
          child: Text('Example4'),
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
          String algorithmValue = Provider.of<Algorithm>(context, listen: false).algorithm;
          setState(() {
            intResult = null;
          });
          text = editingController.value.text;

          if(algorithmValue == 'LSTM' && text!='')  {
            Future.delayed(Duration(milliseconds: 30), (){
              apiRepo.getResultLSMT(text).then((value) {
                setState(() {
                  preProcess = "";
                  intResult = value.result;
                  proResult = value;
                });
              });
            });
          }else if(algorithmValue == 'NP' && text!=''){

            Future.delayed(Duration(milliseconds: 30),(){
              apiRepo.getResultNP(text).then((value){
                setState(() {
                  preProcess = "";
                  intResult = value.result;
                  proResult = value;
                });
              });
            });
          }else if(algorithmValue =='SVM'&& text!=''){
            Future.delayed(Duration(milliseconds: 30), (){
              apiRepo.getResultSVM(text).then((value){
                setState(() {
                  preProcess = "";
                  intResult = value.result;
                  proResult = value;
                });
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

  Widget formInputTest(){
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
//      margin: EdgeInsets.only(left: 10),
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
        maxLines: 7,
      ),
    );
  }

  Widget resultWidget(){
    return Container(
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
      return Row(
        children: <Widget>[
          Icon(Icons.warning, color: Colors.red,size: 17,),
          SizedBox(width: 10,),
          Text("SPAM"),
        ],
      );
    }else{
      return Row(
        children: <Widget>[
          Icon(Icons.check_circle, color: Theme.of(context).primaryColor,size: 17,),
          SizedBox(width: 10,),
          Text("NO SPAM"),
        ],
      );
    }
  }
  Widget preProcessing(){
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: MediaQuery.of(context).size.width* 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Theme.of(context).primaryColor
          )
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
              child: preProcess == null?Container():Text(preProcess),
          ),
        ],
      ),
    );
  }
}


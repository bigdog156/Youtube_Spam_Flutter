import 'package:Youtube_Spam/model/algorithm.dart';
import 'package:Youtube_Spam/model/multi_predict.dart';
import 'package:Youtube_Spam/repo/repo_api.dart';
import 'package:Youtube_Spam/widgets/dropdown_basic.dart';
import 'package:Youtube_Spam/widgets/title_group.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageMultiTask extends StatefulWidget {
  @override
  _PageMultiTaskState createState() => _PageMultiTaskState();
}

class _PageMultiTaskState extends State<PageMultiTask> {
  int intListTest=0;
  String valueCurrent;
  String method;
  ApiRepo apiRepo;
  Multi _multi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valueCurrent = "List 1";
    method = "LSTM";
    apiRepo = ApiRepo(urlApi: "http://127.0.0.1:1998/");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    apiRepo = ApiRepo(urlApi: Provider.of<Algorithm>(context).url);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TitleGroup(),
            Container(
              child: Text(""),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildDropdown(context),
                buildDropdownMethod(context),
                buildButtonSend(),

              ],
            ),
            buildResult()
          ],
        )
    );
  }
  Widget buildResult(){
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor)
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10,10),
            child: Text(_multi==null?"":_multi.multi),
          ),
        ],
      ),
    );
  }
  Widget buildItem(){
    return Container(
      child: Text(""),
    );
  }

  Widget buildDropdown(BuildContext context){
    List<String> _items = ['List 1','List 2'];
    return DropDownBasic(
      items: _items,
      value: valueCurrent,
      stringCallback: (String newValue){
        setState(() {
          valueCurrent = newValue;
          if( valueCurrent == "List 2"){
            intListTest = 1;
          }else {
            intListTest = 0;
          }
        });
      },
    );
  }
  Widget buildDropdownMethod(BuildContext context){
    List<String> _items = ['LSTM','NB','SVM'];
    return DropDownBasic(
      items: _items,
      value: method,
      stringCallback: (String newValue){
        setState(() {
          method = newValue;
        });
      },
    );
  }
  Widget buildButtonSend(){
    return OutlineButton(
      onPressed: (){
          setState(() {
            _multi = Multi(multi: "loading ...");
          });
          apiRepo.getMultiPredict(method,intListTest).then((value){
            setState(() {
              _multi = value;
            });
          });
      },
      child: Row(
        children: <Widget>[
          Text("Send"),
          Icon(Icons.send)
        ],
      )
    );
  }
}

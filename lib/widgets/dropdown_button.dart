import 'package:Youtube_Spam/model/algorithm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DropDownButtonAlgorithm extends StatefulWidget {
  @override
  _DropDownButtonAlgorithmState createState() => _DropDownButtonAlgorithmState();
}

class _DropDownButtonAlgorithmState extends State<DropDownButtonAlgorithm> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Algorithm>(
      builder: (context, item, child){
        return DropdownButton(
          value: item.algorithm,
          icon: Icon(Icons.arrow_downward),
          iconSize: 20,
          elevation: 16,
          underline: Container(
            height: 2,
            color: Theme.of(context).primaryColor,
          ),
          onChanged: (String newValue){
            setState(() {
              item.changeAlgorithm(newValue);
            });
          },
          items: <String>['LSTM','NP','SVM'].map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      }
    );
  }
}

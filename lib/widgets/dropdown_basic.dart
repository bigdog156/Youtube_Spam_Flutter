import 'dart:ui';

import 'package:Youtube_Spam/model/algorithm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef StringValue = void Function(String);

class DropDownBasic extends StatefulWidget {
  final List<String> items;
  final String value;
  final StringValue stringCallback;
  DropDownBasic({
        @required this.items,
        @required this.value,
        @required this.stringCallback});
  @override
  _DropDownBasicState createState() => _DropDownBasicState();
}

class _DropDownBasicState extends State<DropDownBasic> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
            value: widget.value,
            icon: Icon(Icons.arrow_downward),
            iconSize: 20,
            elevation: 16,
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            onChanged: widget.stringCallback,
            items: widget.items.map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
    );
  }
}

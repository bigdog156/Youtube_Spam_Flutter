import 'package:flutter/material.dart';

class TitleGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Text("Group 5 - Fire ", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
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
}

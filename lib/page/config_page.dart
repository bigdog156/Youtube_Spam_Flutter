import 'package:Youtube_Spam/model/algorithm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Config IP"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Change IP address: "),
                formInputIP(),
                buildButton()
              ],
            ),
          )
      ),
    );
  }

  Widget formInputIP() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
//      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme
              .of(context)
              .primaryColor)
      ),
      child: TextFormField(
        decoration: new InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(8),
            hintText: Provider.of<Algorithm>(context).url
        ),
        controller: _controller,
        textInputAction: TextInputAction.done,
        maxLines: 1,
      ),
    );
  }

  Widget buildButton() {
    return Consumer<Algorithm>(
      builder: (_, value, child) {
        return OutlineButton(
          child: Text("Done"),
          onPressed: () {
            value.changeUrl(_controller.text);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}

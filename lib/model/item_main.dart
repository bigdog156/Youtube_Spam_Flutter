import 'package:flutter/cupertino.dart';

class ItemHistory{
  final String text;
  final int result;
  final String algorithm;
  ItemHistory({@required this.text, this.result, this.algorithm});
}
class ItemMain extends ChangeNotifier{
  final List<String> listText = [];
  final String text = '';
  final String algorithm = '';
  final List<ItemHistory> historyList = [];
}
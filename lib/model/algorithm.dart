import 'package:flutter/cupertino.dart';

class Algorithm extends ChangeNotifier{
  String algorithm = 'LSTM';
  String preProcessText = 'Clean Text';
  String url = "http://127.0.0.1:1998/";
  void changeAlgorithm(String algo){
    this.algorithm = algo;
    notifyListeners();
  }

  void changePreProcessText(String pre){
    this.preProcessText = pre;
    notifyListeners();
  }
  void changeUrl(String url){
    this.url = "http://"+url;
    notifyListeners();
  }
}
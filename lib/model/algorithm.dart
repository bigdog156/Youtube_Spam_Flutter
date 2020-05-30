import 'package:flutter/cupertino.dart';

class Algorithm extends ChangeNotifier{
  String algorithm = 'LSTM';
  String preProcessText = 'Clean Text';
  void changeAlgorithm(String algo){
    this.algorithm = algo;
    notifyListeners();
  }

  void changePreProcessText(String pre){
    this.preProcessText = pre;
    notifyListeners();
  }
}
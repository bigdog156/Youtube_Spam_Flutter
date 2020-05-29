import 'package:flutter/cupertino.dart';

class Algorithm extends ChangeNotifier{
  String algorithm = 'LSTM';

  void changeAlgorithm(String algo){
    this.algorithm = algo;
    notifyListeners();
  }
}
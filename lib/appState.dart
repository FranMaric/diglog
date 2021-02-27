import 'package:flutter/foundation.dart';

//Function
import 'functions/validateExpression.dart';
import 'functions/statesFromExpression.dart';
import 'functions/varNamesFromExpression.dart';

class AppState extends ChangeNotifier {
  List<String> _varNames = ["A", "B", "C"];
  List<int> _states = [0, 0, 1, 0, 1, 1, 1, 1]; //A + B * not C

  String _expression;
  String _valid;

  void setExpression(String e) {
    _expression = e;
  }

  void submitStates() {
    _valid = validateExpression(_expression);

    if (_valid == null) {
      _varNames = varNamesFromExpression(_expression);
      _states = statesFromExpression(_expression);
    }
    notifyListeners();
  }

  //Getters
  get varNames => _varNames;
  get states => _states;
  get valid => _valid;
}

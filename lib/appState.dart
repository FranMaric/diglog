import 'package:flutter/material.dart';
import 'firestore_service.dart';

//Function
import 'package:diglog/functions/validateExpression.dart';
import 'package:diglog/functions/statesFromExpression.dart';
import 'package:diglog/functions/varNamesFromExpression.dart';
import 'package:diglog/functions/statesToExpression.dart';

enum typeEnum { expression, ktable, table } //ENUM
enum expressionType { literal, algebraic, logical, programming }

class AppState extends ChangeNotifier {
  List<String> _varNames = ["A", "B", "C"];
  List<int> _states = [0, 0, 1, 0, 1, 1, 1, 1]; //A + B * not C

  String _expression;
  bool _expressionChanged = true;
  String _valid;

  typeEnum _inputType = typeEnum.expression;

  expressionType _and = expressionType.programming;
  expressionType _or = expressionType.programming;
  expressionType _not = expressionType.programming;

  TextEditingController controller = TextEditingController();

  //Getters
  get varNames => _varNames;
  get states => _states;
  get valid => _valid;
  get inputType => _inputType;

  get and => _and;
  get or => _or;
  get not => _not;

  //Functions
  void setExpression(String e) {
    _expression = e;
    _expressionChanged = true;
  }

  void submitStates() {
    _valid = validateExpression(_expression);

    if (_valid == null) {
      _varNames = varNamesFromExpression(_expression);
      _states = statesFromExpression(_expression);
    }
    notifyListeners();
    if (_expressionChanged &&
        _expression != "" &&
        _expression.replaceAll(" ", "") != "") {
      uploadExpression(
          _expression, statesToExpression(_states, _varNames, _and, _or, _not));
      _expressionChanged = false;
    }
  }

  void updateState(int index) {
    if (_states[index] == 0)
      _states[index] = 1;
    else
      _states[index] = 0;

    notifyListeners();
  }

  void reset() {
    _states = [];
    _varNames = [];
    _expression = "";
    _valid = null;
    controller.text = "";

    notifyListeners();
  }

  void setDefaultValues() {
    _varNames = ["A", "B"];
    _states = [0, 0, 0, 0]; //A + B * not C
    _expression = "";
    _valid = null;

    notifyListeners();
  }

  void incrementVarCount() {
    if (_varNames.length > 5) return;

    _states = _states + List.generate(_states.length, (i) => 0);
    _varNames = "ABCDEFGIJ".split("").sublist(0, _varNames.length + 1);
    notifyListeners();
  }

  void decrementVarCount() {
    if (_varNames.length < 3) return;

    _states = _states.sublist(0, (_states.length / 2).floor());
    _varNames = "ABCDEFGIJ".split("").sublist(0, _varNames.length - 1);
    notifyListeners();
  }

  void setCurrentInputType(typeEnum newType) {
    _inputType = newType;
    notifyListeners();
  }

  void setCurrentOutputType(
      {expressionType newAnd, expressionType newOr, expressionType newNot}) {
    if (newAnd != null) _and = newAnd;
    if (newOr != null) _or = newOr;
    if (newNot != null) _not = newNot;
    notifyListeners();
  }
}

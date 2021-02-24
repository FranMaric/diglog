import 'dart:math'; //pow function

//Functions
import 'package:diglog/functions/evaluate.dart';
import 'package:diglog/functions/intToBinaryString.dart';
import 'package:diglog/functions/varNamesFromExpression.dart';

const List<String> not = ["NOT", "not", "!", "¬", "~"];
const List<String> or = ["OR", "or", "+", "ˇ", "||"];
const List<String> and = ["AND", "and", "*", "^", "&&"];

List<int> expressionToStates(String expression) {
  List<String> varNames = varNamesFromExpression(expression);
  String state;
  String tempExpression;
  List<int> states = [];

  expression = expression.replaceAll(" ", "");
  expression = replaceOperators(expression);

  List<int> varNamesOrder = List.generate(varNames.length, (i) => i);

  String tempString;
  int tempInt;
  bool sorted = false;
  while (!sorted) {
    sorted = true;
    for (int i = 0; i < varNames.length - 1; i++) {
      if (varNames[i].length < varNames[i + 1].length) {
        tempString = varNames[i];
        varNames[i] = varNames[i + 1];
        varNames[i + 1] = tempString;

        tempInt = varNamesOrder[i];
        varNamesOrder[i] = varNamesOrder[i + 1];
        varNamesOrder[i + 1] = tempInt;
        sorted = false;
      }
    }
  }
  varNames = varNamesFromExpression(expression);
  print([varNames, varNamesOrder]);

  for (int i = 0; i < pow(2, varNames.length); i++) {
    state = intToBinaryString(i, varNames.length);
    tempExpression = expression;

    for (int j = 0; j < varNames.length; j++) {
      tempExpression = tempExpression.replaceAll(
          varNames[varNamesOrder[j]], state[varNamesOrder[j]]);
    }
    states.add(evaluate(tempExpression));
  }

  return states;
}

// Replaces all operators to +,*,! - for simplification of process
String replaceOperators(String expression) {
  for (int i = 0; i < not.length; i++)
    expression = expression.replaceAll(not[i], "!");
  for (int i = 0; i < and.length; i++)
    expression = expression.replaceAll(and[i], "*");
  for (int i = 0; i < or.length; i++)
    expression = expression.replaceAll(or[i], "+");

  expression = expression.replaceAll("[", "(");
  expression = expression.replaceAll("]", ")");

  expression = expression.replaceAll("{", "(");
  expression = expression.replaceAll("}", ")");

  return expression;
}

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

  for (int i = 0; i < pow(2, varNames.length); i++) {
    state = intToBinaryString(i, varNames.length);
    tempExpression = expression;

    for (int j = 0; j < varNames.length; j++) {
      tempExpression = tempExpression.replaceAll(varNames[j], state[j]);
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

main() {
  expressionToStates("not a and b");
}

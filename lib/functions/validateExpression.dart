const List<String> operators = [
  // literal
  "NOT",
  "OR",
  "AND",
  "not",
  "or",
  "and",
  // Algebraic
  "!",
  "+",
  "*",
  // Logical
  "¬",
  "ˇ",
  "^",
  // Programming
  "~",
  "||",
  "&&",
  // Brackets
  "(",
  ")",
  "[",
  "]",
  "{",
  "}"
];

String validateExpression(String expression) {
  if (expression == null || expression.isEmpty) return null;
  int depth = 0;
  for (int i = 0; i < expression.length; i++) {
    if (expression[i] == "(")
      depth++;
    else if (expression[i] == ")") depth--;
  }
  if (depth > 0)
    return "Missing closing paranthesis.";
  else if (depth < 0) return "Missing opening paranthesis.";

  for (int i = 0; i < operators.length; i++) {
    expression = expression.replaceAll(operators[i], ";");
  }

  int start = 0;
  String varName;

  for (int i = 0; i < expression.length; i++) {
    if (expression[i] == ";" || i == expression.length - 1) {
      if (i == expression.length - 1 && expression[i] != ";")
        varName = expression.substring(start, i + 1);
      else {
        varName = expression.substring(start, i);
      }

      if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(varName))
        return "Variable names can contain only letters and numbers.";

      start = i + 1;
    }
  }

  return null;
}

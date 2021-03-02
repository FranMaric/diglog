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
  "×",
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
// Example: "A+B+C*C*D" -> ["A","B","C","D"]
List<String> varNamesFromExpression(String expression) {
  List<String> varNames = [];

  //Remove all spaces
  expression = expression.replaceAll(" ", "");

  // Replace all operators with semicolon
  for (int i = 0; i < operators.length; i++) {
    expression = expression.replaceAll(operators[i], ";");
  }

  //Add all vars to list if they contain only letters
  int start = 0;
  String varName;

  for (int i = 0; i < expression.length; i++) {
    if (expression[i] == ";" || i == expression.length - 1) {
      if (i == expression.length - 1 && expression[i] != ";")
        varName = expression.substring(start, i + 1);
      else {
        varName = expression.substring(start, i);
      }

      if (RegExp(r'^[a-zA-Z0-9]+$').hasMatch(varName) &&
          !varNames.contains(varName)) {
        varNames.add(varName);
      }
      start = i + 1;
    }
  }

  return varNames;
}

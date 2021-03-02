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

String validateExpression(String expression) {
  if (expression == null || expression.isEmpty) return null;
  int depth = 0;
  for (int i = 0; i < expression.length; i++) {
    if (!(operators +
            "QWERTZUIOPŠĐŠŽASDFGHJKLČĆYXCVBNMqwertzuiopšđžasdfghjklčćyxycvbnm0123456789 "
                .split(""))
        .contains(expression[i])) {
      return "Variable names can contain only letters and numbers.";
    }

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

  return null;
}

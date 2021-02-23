// expression must not contain spaces!!!
// expression can contain only !,+,*,0,1
int evaluate(String expression) {
  //Remove useless paranthesis
  expression = expression.replaceAll("()", "");

  List<int> paranthesis = [];
  int depth = 0;
  for (int i = 0; i < expression.length; i++) {
    if (expression[i] == "(") {
      depth++;
      if (depth == 1) {
        paranthesis.add(i);
      }
    } else if (expression[i] == ")") {
      if (depth == 1) {
        paranthesis.add(i);
      }
      depth--;
    }
  }
  if (depth != 0) print("Paranthesis are messed up!");

  //Evaluate each depth=1 paranthesis seperately = recursion - uuuuu fancy
  for (int i = 0; i < paranthesis.length / 2; i++) {
    if (paranthesis[i * 2] - 1 >= 0 &&
        expression[paranthesis[i * 2] - 1] == "!") {
      expression = expression.substring(0, paranthesis[i * 2] - 1) +
          (evaluate(expression.substring(
                      paranthesis[i * 2] + 1, paranthesis[i * 2 + 1])) ==
                  0
              ? "1"
              : "0") +
          expression.substring(paranthesis[i * 2 + 1] + 1);
    } else {
      expression = expression.substring(0, paranthesis[i * 2]) +
          evaluate(expression.substring(
                  paranthesis[i * 2] + 1, paranthesis[i * 2 + 1]))
              .toString() +
          expression.substring(paranthesis[i * 2 + 1] + 1);
    }
  }

  //If we have reached here there are no brackets and we can just multiplie and add everything

  //Remove all double negation
  expression = expression.replaceAll("!!", "");
  //Handles negation
  for (int i = 0; i < expression.length - 1; i++) {
    if (expression[i] == "!" &&
        (expression[i + 1] == "0" || expression[i + 1] == "1")) {
      expression = expression.substring(0, i) +
          (expression[i + 1] == "0" ? "1" : "0") +
          expression.substring(i + 2);
    }
  }
  //Multiplication
  for (int i = 1; i < expression.length - 1; i++) {
    if (expression[i] == "*") {
      if (expression[i - 1] == "0" || expression[i + 1] == "0") {
        expression =
            expression.substring(0, i - 1) + "0" + expression.substring(i + 2);
      } else {
        expression =
            expression.substring(0, i - 1) + "1" + expression.substring(i + 2);
      }
      i -= 2;
    }
  }
  //Addition
  for (int i = 1; i < expression.length - 1; i++) {
    if (expression[i] == "+") {
      if (expression[i - 1] == "0" && expression[i + 1] == "0") {
        expression =
            expression.substring(0, i - 1) + "0" + expression.substring(i + 2);
      } else {
        expression =
            expression.substring(0, i - 1) + "1" + expression.substring(i + 2);
      }
      i -= 2;
    }
  }

  if (expression == "0")
    return 0;
  else if (expression == "1")
    return 1;
  else //Something has fucked up if it has reached this statement, ups
    return -1;
}

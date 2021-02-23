// expression must not contain spaces!!!
// expression can contain only !,+,*,0,1
int evaluate(String expression) {
  //Remove all double negation
  expression = expression.replaceAll("!!", "");

  //Depth=0 which means there are no brackets such as 0+1*0
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

main() {
  // print(evaluate("!0"));
}

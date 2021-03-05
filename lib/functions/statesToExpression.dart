import 'package:diglog/functions/intToBinaryString.dart';
import 'package:diglog/services/appState.dart' show expressionType;

const Map<expressionType, int> expressionTypeToIndex = {
  expressionType.literal: 0,
  expressionType.algebraic: 1,
  expressionType.logical: 2,
  expressionType.programming: 3,
};

String statesToExpression(List<int> states, List<String> varNames,
    expressionType _and, expressionType _or, expressionType _not) {
  int sum = states.fold(0, (p, c) => p + c);
  if (sum == states.length)
    return "1";
  else if (sum == 0) return "0";

  List<List<String>> groups = List.generate(varNames.length + 1, (i) => []);
  int counter;
  String binaryInt;
  for (int i = 0; i < states.length; i++) {
    if (states[i] == 1) {
      counter = 0;
      binaryInt = intToBinaryString(i, varNames.length);
      for (int j = 0; j < binaryInt.length; j++) {
        if (binaryInt[j] == "1") counter++;
      }
      groups[counter].add(binaryInt);
    }
  }

  List<List<String>> prevGroups;
  while (!compareArrays(groups, prevGroups)) {
    prevGroups = groups;
    groups = eliminate(groups);
  }

  List<String> implicants = [];

  for (int i = 0; i < groups.length; i++)
    for (int j = 0; j < groups[i].length; j++) implicants.add(groups[i][j]);

  String expression = "";
  String implicant;

  implicants = implicants.toSet().toList();
  implicants = implicants.reversed.toList();

  String and = [" and ", "*", "^", " && "][expressionTypeToIndex[_and]];
  String or = [" or ", "+", "ˇ", " || "][expressionTypeToIndex[_or]];
  String not = [" not ", "!", "¬", "~"][expressionTypeToIndex[_not]];

  for (int i = 0; i < implicants.length; i++) {
    implicant = "";
    for (int j = 0; j < varNames.length; j++) {
      if (implicants[i][j] == "0") {
        implicant += not +
            varNames[j] +
            (shouldAddMultiplication(implicants[i], j) ? and : "");
      } else if (implicants[i][j] == "1") {
        implicant += varNames[j] +
            (shouldAddMultiplication(implicants[i], j) ? and : "");
      }
    }
    expression += implicant + (i != (implicants.length - 1) ? or : "");
  }

  return expression;
}

bool shouldAddMultiplication(String implicant, int index) {
  if (index == implicant.length - 1) return false;
  if (implicant.substring(index + 1).contains("0")) return true;
  if (implicant.substring(index + 1).contains("1")) return true;
  return false;
}

List<List<String>> eliminate(List<List<String>> groups) {
  List<List<String>> newGroups = List.generate(groups.length, (i) => []);

  List<List<bool>> reduced = List.generate(
      groups.length, (i) => List.generate(groups[i].length, (index) => false));

  for (int i = 0; i < groups.length - 1; i++) {
    for (int j = 0; j < groups[i].length; j++) {
      for (int k = 0; k < groups[i + 1].length; k++) {
        if (diff(groups[i][j], groups[i + 1][k]) == 1) {
          for (int l = 0; l < groups.length; l++) {
            if (groups[i][j][l] != groups[i + 1][k][l]) {
              newGroups[i].add(groups[i][j].substring(0, l) +
                  "x" +
                  groups[i][j].substring(l + 1));
              reduced[i][j] = true;
              reduced[i + 1][k] = true;
              break;
            }
          }
        }
      }
    }
  }

  for (int i = 0; i < reduced.length; i++) {
    for (int j = 0; j < reduced[i].length; j++) {
      if (reduced[i][j] == false) {
        newGroups[i].add(groups[i][j]);
      }
    }
  }

  return newGroups;
}

bool compareArrays(List<List<String>> list1, List<List<String>> list2) {
  //lists must have equal lengths in all dimensions!!!
  if (list1 == null && list2 == null)
    return true;
  else if (list1 == null || list2 == null) return false;

  for (int i = 0; i < list1.length; i++) {
    for (int j = 0; j < list1[i].length; j++) {
      if (list1[i][j] != list2[i][j]) return false;
    }
  }

  return true;
}

int diff(String exp1, String exp2) {
  if (exp1.length != exp2.length)
    return -1; //They must be the same length to be able to compare them

  int counter = 0;
  for (int i = 0; i < exp1.length; i++) if (exp1[i] != exp2[i]) counter++;
  return counter;
}

List<String> grayCode(int n) {
  if (n == 0 || n == null) return []; //Null safety!
  if (n == 1) {
    return ["0", "1"];
  }
  List<String> codes = [];
  List<String> tempCodes = grayCode(n - 1);
  for (int i = 0; i < tempCodes.length; i++) {
    codes.add(tempCodes[i]);
  }
  for (int i = tempCodes.length - 1; i >= 0; i--) {
    codes.add(tempCodes[i]);
  }
  for (int i = 0; i < codes.length / 2; i++) {
    codes[i] = "0" + codes[i];
  }
  for (int i = (codes.length / 2).round(); i < codes.length; i++) {
    codes[i] = "1" + codes[i];
  }
  return codes;
}

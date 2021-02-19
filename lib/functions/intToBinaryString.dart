String intToBinaryString(int n, int registerSize) {
  String output = n.toRadixString(2);
  output = "0" * (registerSize - output.length) + output;
  return output;
}

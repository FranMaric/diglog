import 'dart:math';

int binaryStringToInt(String binaryString) {
  int out = 0;
  for (int i = 0; i < binaryString.length; i++)
    out += binaryString[i] == "1" ? pow(2, binaryString.length - i - 1) : 0;
  return out;
}

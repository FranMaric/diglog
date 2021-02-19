import 'package:diglog/functions/binaryStringToInt.dart';
import 'package:diglog/functions/grayCode.dart';

List<int> stateDecoder(int x, int y) {
  List<int> states = [];

  List<String> xList = grayCode(x);
  List<String> yList = grayCode(y);

  for (int _y = 0; _y < yList.length; _y++)
    for (int _x = 0; _x < xList.length; _x++) {
      states.add(binaryStringToInt(xList[_x] + yList[_y]));
    }
  return states;
}

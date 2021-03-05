import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platform_detect/platform_detect.dart';

Future<void> uploadExpression(String expression, String minimizedExpression) {
  CollectionReference expressions =
      FirebaseFirestore.instance.collection('expressions');

  var data = {
    "expression": expression,
    "minimizedExpression": minimizedExpression,
    "timestamp": DateTime.now().toString(),
    "platform": operatingSystem.name,
    "browser": browser.name,
  };

  return expressions.add(data);
}

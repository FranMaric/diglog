import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platform_detect/platform_detect.dart';

Future<void> uploadExpression(String expression) async {
  CollectionReference expressions =
      FirebaseFirestore.instance.collection('expressions');

  var data = {
    "expression": expression,
    "timestamp": FieldValue.serverTimestamp(),
    "platform": operatingSystem.name,
    "browser": browser.name,
  };

  return expressions.add(data);
}

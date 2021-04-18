import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SolvedCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('data')
            .doc('live-data')
            .get(),
        builder: (context, snap) {
          if (!snap.hasData || snap.hasError)
            return CircularProgressIndicator();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              "Solved " +
                  snap.data['solved-counter'].toString() +
                  " expressions.",
              style: TextStyle(color: Colors.blue),
            ),
          );
        });
  }
}

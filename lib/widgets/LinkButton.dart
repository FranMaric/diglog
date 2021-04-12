import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String url;
  final String text;

  const LinkButton({this.url, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => launch(url),
        child: Text(
          text,
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

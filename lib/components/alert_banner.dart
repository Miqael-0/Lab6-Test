import 'package:flutter/material.dart';

class AlertBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Text(
        'ABD1234 IS UNREACHABLE!',
        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

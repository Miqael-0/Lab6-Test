import 'package:flutter/material.dart';

class Gauge extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const Gauge({required this.title, required this.value, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.3),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}

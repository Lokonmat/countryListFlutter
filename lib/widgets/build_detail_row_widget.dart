import 'package:flutter/material.dart';
import 'package:ulkeler/models/ulke.dart';

class BuildDetailRow extends StatelessWidget {
  String baslik;
  String detail;

  BuildDetailRow({required this.baslik, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            baslik,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            detail,
            style: TextStyle(fontSize: 24),
          ),
        )
      ],
    );
  }
}

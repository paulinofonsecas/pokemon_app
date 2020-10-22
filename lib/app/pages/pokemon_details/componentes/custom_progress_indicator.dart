import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key key,
    @required this.size,
    this.baseStat,
  }) : super(key: key);

  final BoxConstraints size;
  final int baseStat;

  @override
  Widget build(BuildContext context) {
    var porcentagem = ((baseStat * 100 / 100) / 100);

    return Stack(
      children: [
        Container(
          height: 4,
          width: size.maxWidth * 0.60,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(90),
          ),
        ),
        Container(
          height: 4,
          width: (size.maxWidth * 0.60) * porcentagem,
          decoration: BoxDecoration(
            color: porcentagem >= 0.50 ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(90),
          ),
        ),
      ],
    );
  }
}


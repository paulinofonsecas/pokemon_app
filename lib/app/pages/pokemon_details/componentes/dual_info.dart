import 'package:flutter/material.dart';

class DualInfo extends StatelessWidget {
  const DualInfo({
    Key key,
    @required this.first,
    @required this.secound,
  }) : super(key: key);

  final String first;
  final String secound;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(first),
        SizedBox(width: 50),
        Text(
          secound,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

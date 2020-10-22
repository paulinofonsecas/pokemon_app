import 'package:flutter/material.dart';

class DuetDetail extends StatelessWidget {
  const DuetDetail({
    Key key,
    @required this.first,
    @required this.secound,
  }) : super(key: key);

  final String first;
  final dynamic secound;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          first,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          secound.toString(),
          style: TextStyle(
            color: Colors.amber,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

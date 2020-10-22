import 'package:flutter/material.dart';

class Sprit extends StatelessWidget {
  const Sprit({
    Key key,
    this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'url',
      loadingBuilder: (context, child, loading) {
        if (loading == null) {
          return child;
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
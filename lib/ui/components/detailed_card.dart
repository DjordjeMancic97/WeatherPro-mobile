import 'package:flutter/material.dart';

class DetailedCard extends StatelessWidget {
  final String header;
  final String text;

  const DetailedCard({Key key, this.text, this.header}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            header,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

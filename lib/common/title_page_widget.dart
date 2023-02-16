import 'package:flutter/material.dart';

class TitlePageWidget extends StatelessWidget {
  final String text;

  const TitlePageWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFBDBDBD),
          fontSize: 20.0,
          fontFamily: 'Oxygen-Regular',
        ),
      ),
    );
  }
}

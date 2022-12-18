import 'package:flutter/material.dart';

class IconColumn extends StatelessWidget {
  final IconData? icon;
  final String? containerText;

  const IconColumn({
    this.icon,
    this.containerText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          containerText!,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xff8d8e98),
          ),
        ),
      ],
    );
  }
}

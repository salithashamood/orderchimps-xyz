import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final String buttonText;
  final VoidCallback onTap;
  const ButtonWidget(
      {super.key,
      required this.width,
      required this.buttonText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.bodyMedium,
          )),
    );
  }
}

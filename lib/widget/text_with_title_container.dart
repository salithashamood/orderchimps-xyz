import 'package:flutter/material.dart';

class TextWithTitleContainer extends StatelessWidget {
  final String title;
  final String hintText;
  final String errorText;
  final bool isPassword;
  final TextEditingController controller;
  const TextWithTitleContainer(
      {super.key,
      required this.title,
      required this.hintText,
      this.isPassword = false,
      required this.errorText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        TextFormField(
          validator: (value) => value!.isEmpty ? errorText : null,
          style: Theme.of(context).textTheme.titleMedium,
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleMedium,
              contentPadding: EdgeInsets.zero),
        ),
      ],
    );
  }
}

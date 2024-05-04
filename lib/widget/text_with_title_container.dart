import 'package:flutter/material.dart';

class TextWithTitleContainer extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isPassword;
  const TextWithTitleContainer(
      {super.key,
      required this.title,
      required this.hintText,
      this.isPassword = false});

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
          style: Theme.of(context).textTheme.titleMedium,
          // controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleMedium,
              contentPadding: EdgeInsets.zero
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),
              ),
        ),
      ],
    );
  }
}

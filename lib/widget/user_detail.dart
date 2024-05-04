import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final String title;
  final String subTitle;
  const UserDetail({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
          ),
          Text(
            " - ",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            subTitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

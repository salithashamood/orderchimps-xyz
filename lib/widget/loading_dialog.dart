import 'package:flutter/material.dart';

Future loadingDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text('Loading...'),
        content: SizedBox(
          height: 50,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    },
  );
}

Future successDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text('Success'),
      );
    },
  );
}

Future dynamicMessageDialog(BuildContext context, String message) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(message),
      );
    },
  );
}

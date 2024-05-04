import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xyz/theme/colors.dart';
import 'package:xyz/widget/button_wigdet.dart';
import 'package:xyz/widget/logo_widget.dart';
import 'package:xyz/widget/text_with_title_container.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(50),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LogoWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome to Eridanus",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Login to continue shopping.",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const TextWithTitleContainer(
                        title: "Username/Email", hintText: "username"),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextWithTitleContainer(
                        title: "Password", hintText: "password"),
                    const SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(
                      buttonText: "LOGIN",
                      onTap: () {},
                      width: double.infinity,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Sign Up.',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

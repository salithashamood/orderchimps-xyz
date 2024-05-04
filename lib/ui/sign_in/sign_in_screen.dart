import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xyz/core/service_locator.dart';
import 'package:xyz/theme/colors.dart';
import 'package:xyz/ui/navigation/cubit/navigation_cubit.dart';
import 'package:xyz/ui/navigation/navigation_screen.dart';
import 'package:xyz/ui/sign_in/cubit/sign_in_cubit.dart';
import 'package:xyz/widget/button_wigdet.dart';
import 'package:xyz/widget/loading_dialog.dart';
import 'package:xyz/widget/logo_widget.dart';
import 'package:xyz/widget/text_with_title_container.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SignInCubit>();
    return SafeArea(
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInUserLoginFaield) {
            Navigator.pop(context);
            const snackBar = SnackBar(
              content: Text(
                'Email or Password incorrect',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is SignInUserLoginSuccess) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => serviceLocator<NavigationCubit>(),
                    child: const NavigationScreen()),
              ),
            );
          }
          if (state is SignInUserLoginLoading) {
            loadingDialog(context);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: const EdgeInsets.all(50),
            height: double.infinity,
            width: double.infinity,
            child: Form(
              key: controller.signInFormKey,
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
                        TextWithTitleContainer(
                            controller: controller.emailTextEditingController,
                            errorText: "Email/Username cannot be empty",
                            title: "Username/Email",
                            hintText: "username"),
                        const SizedBox(
                          height: 20,
                        ),
                        TextWithTitleContainer(
                          controller: controller.passwordTextEditingController,
                          errorText: "password cannot be empty",
                          title: "Password",
                          hintText: "password",
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ButtonWidget(
                          buttonText: "LOGIN",
                          onTap: () => controller.clickSignInButton(),
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

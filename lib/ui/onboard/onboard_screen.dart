import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xyz/core/service_locator.dart';
import 'package:xyz/ui/navigation/cubit/navigation_cubit.dart';
import 'package:xyz/ui/navigation/navigation_screen.dart';
import 'package:xyz/ui/onboard/cubit/onboard_cubit.dart';
import 'package:xyz/ui/sign_in/cubit/sign_in_cubit.dart';
import 'package:xyz/ui/sign_in/sign_in_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnboardCubit, OnboardState>(
        listener: (context, state) {
          if (state is OnboardMoveToLogin) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<SignInCubit>(
                      create: (context) => serviceLocator<SignInCubit>(),
                      child: const SignInScreen()),
                ),
              );
            }
            if (state is OnboardMoveToHome) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<NavigationCubit>(
                      create: (context) => serviceLocator<NavigationCubit>(),
                      child: const NavigationScreen()),
                ),
              );
            }
        },
        builder: (context, state) {
          return const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

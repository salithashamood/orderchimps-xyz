import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xyz/core/service_locator.dart';
import 'package:xyz/theme/theme_data.dart';
import 'package:xyz/ui/onboard/cubit/onboard_cubit.dart';
import 'package:xyz/ui/onboard/onboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eridanus',
        theme: lightTheme,
        home: BlocProvider<OnboardCubit>(
          create: (context) => serviceLocator<OnboardCubit>(),
          child: const OnboardScreen(),
        ));
  }
}

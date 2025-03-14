import 'package:flutter/material.dart';
import 'package:xyz/core/service_locator.dart';
import 'package:xyz/theme/colors.dart';
import 'package:xyz/ui/home/cubit/home_cubit.dart';
import 'package:xyz/ui/home/home_screen.dart';
import 'package:xyz/ui/navigation/cubit/navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xyz/ui/profile/cubit/profile_cubit.dart';
import 'package:xyz/ui/profile/profile_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<NavigationCubit>();
    List<Widget> widgetList = [
      BlocProvider<HomeCubit>(
        create: (context) => serviceLocator<HomeCubit>(),
        child: const HomeScreen(),
      ),
      Container(),
      Container(),
      Container(),
      BlocProvider<ProfileCubit>(
        create: (context) => serviceLocator<ProfileCubit>(),
        child: const ProfileScreen(),
      ),
    ];
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: widgetList[state],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: primaryColor,
            backgroundColor: Colors.white,
            elevation: 5,
            currentIndex: state,
            onTap: controller.onTapItem,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 10, color: Colors.grey),
            selectedLabelStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 10, color: primaryColor),
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.social_distance_outlined),
                label: 'Purchase',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}

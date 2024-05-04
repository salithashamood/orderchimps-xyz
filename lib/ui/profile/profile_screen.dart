import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xyz/core/service_locator.dart';
import 'package:xyz/theme/colors.dart';
import 'package:xyz/ui/profile/cubit/profile_cubit.dart';
import 'package:xyz/ui/sign_in/cubit/sign_in_cubit.dart';
import 'package:xyz/ui/sign_in/sign_in_screen.dart';
import 'package:xyz/widget/button_wigdet.dart';
import 'package:xyz/widget/user_detail.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProfileCubit>();
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLogout) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<SignInCubit>(
                      create: (context) => serviceLocator<SignInCubit>(),
                      child: const SignInScreen()),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileDataLoaded) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl: "https://i.pravatar.cc/300",
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: ShapeDecoration(
                              shape: OvalBorder(
                                  side: BorderSide(
                                      width: 2, color: primaryColor)),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          );
                        },
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: baseShimmerColor,
                          highlightColor: highlightShimmerColor,
                          enabled: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                            ),
                            width: 100,
                            height: 100,
                          ),
                        ),
                        fadeInCurve: Curves.easeIn,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    UserDetail(
                        title: "First Name",
                        subTitle: state.userResponseModel.firstName ?? ''),
                    UserDetail(
                        title: "Last Name",
                        subTitle: state.userResponseModel.lastName ?? ''),
                    UserDetail(
                        title: "Email",
                        subTitle: state.userResponseModel.email ?? ''),
                    UserDetail(
                        title: "Phone Number",
                        subTitle: state.userResponseModel.phoneNumber ?? ''),
                    const SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(
                      width: double.infinity,
                      buttonText: "LOGOUT",
                      onTap: () => controller.logOut(),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

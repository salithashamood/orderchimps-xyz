import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xyz/theme/colors.dart';
import 'package:xyz/widget/button_wigdet.dart';
import 'package:xyz/widget/user_detail.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
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
                            side: BorderSide(width: 2, color: primaryColor)),
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
              UserDetail(title: "first_name", subTitle: "first_name"),
              UserDetail(title: "last_name", subTitle: "last_name"),
              UserDetail(title: "email", subTitle: "email"),
              UserDetail(title: "phone_number", subTitle: "phone_number"),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                width: double.infinity,
                buttonText: "LOGOUT",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

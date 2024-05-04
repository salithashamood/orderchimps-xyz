import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xyz/domain/entity/product_entity.dart';
import 'package:xyz/theme/colors.dart';
import 'package:xyz/ui/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeCubit>();
    int _currentImageIndex = 0;
    List<ProductEntity> productList = [
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", null, null, '\$24'),
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", null, null, '\$24'),
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", null, null, '\$24'),
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", null, null, '\$24'),
      ProductEntity('Anggurku Fresh Indonesian Grapes',
          "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ];
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeScrollHorizontal) {
              _currentImageIndex = state.index;
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 350,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: primaryColor,
                            ),
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 25),
                            width: double.infinity,
                            height: 150,
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Search product",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.grey),
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none),
                                  ),
                                )),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 250,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    child: PageView.builder(
                                      onPageChanged: (value) =>
                                          controller.scrollHorizontal(value),
                                      itemCount: 2,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: index % 2 == 0
                                                  ? Colors.grey.shade200
                                                  : Colors.red,
                                            ),
                                            height: 200);
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        height: 25,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 2,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: CircleAvatar(
                                                radius: 5,
                                                backgroundColor:
                                                    index == _currentImageIndex
                                                        ? primaryColor
                                                        : Colors.grey.shade300,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'See More',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(color: primaryColor),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_sharp,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Featured',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Product List
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent: 300),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        ProductEntity product = productList[index];
                        return SizedBox(
                          height: 300,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                height: 200,
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: "https://i.pravatar.cc/300",
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          width: 200,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.contain),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                        baseColor: baseShimmerColor,
                                        highlightColor: highlightShimmerColor,
                                        enabled: true,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          width: 200,
                                          height: 200,
                                        ),
                                      ),
                                      fadeInCurve: Curves.easeIn,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    // Image.network(
                                    //   product.imageUrl,
                                    //   filterQuality: FilterQuality.high,
                                    //   fit: BoxFit.contain,
                                    // ),
                                    if (product.discount != null)
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: const EdgeInsets.all(2),
                                          padding:
                                              const EdgeInsets.only(left: 2),
                                          color: primaryColor,
                                          height: 18,
                                          width: 50,
                                          child: Text(
                                            product.discount!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Text(
                                product.description,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  if (product.price != null)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        product.price!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  Text(
                                    product.afterDiscountPrice,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

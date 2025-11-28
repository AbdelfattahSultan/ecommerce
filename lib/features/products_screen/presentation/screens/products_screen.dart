import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:ecommerce_app/features/products_screen/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/products_cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit()..getProductsByCategory("6439d5b90049ad0b52b90048"),
      child: Scaffold(
        appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsError) {
                return Center(child: Text(state.message));
              } else if (state is ProductsSuccess) {
                final products = state.products;

                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: 20,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.69,
                            ),
                        itemBuilder: (context, index) {
                          var product = products[index];
                          return CustomProductWidget(
                            image: product.imageCover ?? "",
                            title: product.title ?? "",
                            price: (product.price ?? 0).toDouble(),
                            rating: (product.ratingsAverage ?? 0).toDouble(),
                            discountPercentage:
                                (product.priceAfterDiscount ?? 0).toDouble(),
                            description: product.description ?? "",
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ],
                );
              }
              return const Center(child: Text('No products for this category'));
            },
          ),
        ),
      ),
    );
  }
}

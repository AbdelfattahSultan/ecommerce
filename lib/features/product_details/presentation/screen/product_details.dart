import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/product_details/presentation/cubit/details_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/cubit/details_state.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(
            color: ColorManager.appBarTitleColor,
          ).copyWith(fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icSearch),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            ProductDetailsCubit()
              ..fetchProductDetails(Id.toString()),
        child: SingleChildScrollView(
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductDetailsError) {
                return Center(child: Text(state.message));
              } else if (state is ProductDetailsSuccess) {
                var product = state.productDetails;
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductSlider(
                        items: [
                          ProductItem(imageUrl: product.images![0]),
                          ProductItem(imageUrl: product.images![1]),
                          ProductItem(imageUrl: product.images![2]),
                        ],
                        initialIndex: 0,
                      ),

                      const SizedBox(height: 24),

                      ProductLabel(
                        productName: product.title ?? '',
                        productPrice: 'EGP ${product.price ?? ''}',
                      ),

                      const SizedBox(height: 16),

                      ProductRating(
                        productBuyers: product.sold.toString(),
                        productRating: '${product.ratingsAverage} ',
                      ),

                      const SizedBox(height: 16),

                      ProductDescription(
                        productDescription: product.description ?? '',
                      ),
                      const SizedBox(height: 48),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total price',
                                style: getMediumStyle(
                                  color: ColorManager.primary.withOpacity(.6),
                                ).copyWith(fontSize: 18),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'EGP ${product.price ?? ''}',
                                style: getMediumStyle(
                                  color: ColorManager.appBarTitleColor,
                                ).copyWith(fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: CustomElevatedButton(
                              label: 'Add to cart',
                              onTap: () {},
                              prefixIcon: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

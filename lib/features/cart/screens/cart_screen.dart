import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/features/cart/cubit/getCart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/cubit/getCart_cubit/cart_state.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CartCubit()..getUserCart(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartError) {
              return Center(
                child: Text(
                  state.message,
                  style: getMediumStyle(color: ColorManager.textColor),
                ),
              );
            } else if (state is CartSuccess) {
              final cart = state.cart;
              final items = cart.data.products;

              if (items.isEmpty) {
                return Center(
                  child: Text(
                    "Your cart is empty",
                    style: getMediumStyle(
                      fontSize: 16,
                      color: ColorManager.textColor,
                    ),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final product = item.product;

                          return CartItemWidget(
                            imagePath: product.imageCover,
                            title: product.title,
                            price: item.price,
                            rating: product.ratingsAverage,
                            onDeleteTap: () {},
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: items.length,
                      ),
                    ),
                    TotalPriceAndCheckoutBotton(
                      totalPrice: cart.data.totalCartPrice,
                      checkoutButtonOnTap: () {},
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

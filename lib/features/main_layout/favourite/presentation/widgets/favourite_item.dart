import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Routes/Routes.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/favorite_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.finalPrice,
    this.salePrice,
    required this.productId,
    required this.rating,
    this.initialIsFavorite = true,
  });

  final String imageUrl;
  final String title;
  final num finalPrice;
  final num? salePrice;
  final String productId;
  final num rating;
  final bool initialIsFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(
        initialIsFavorite: initialIsFavorite,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.productDetails,
            arguments: productId,
          );
        },
        child: Container(
          height: AppSize.s135,
          padding: EdgeInsets.only(right: AppSize.s8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16),
            border: Border.all(
              color: ColorManager.primary.withOpacity(.3),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // صورة المنتج
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                  border: Border.all(
                    color: ColorManager.primary.withOpacity(.6),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                  child: CachedNetworkImage(
                    width: AppSize.s120,
                    height: AppSize.s135,
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: ColorManager.primary),
                  ),
                ),
              ),

              // تفاصيل المنتج (اسم + سعر + تقييم)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.s8),
                  child: FavouriteItemDetails(
                    title: title,
                    finalPrice: finalPrice,
                    salePrice: salePrice,
                    rating: rating,
                  ),
                ),
              ),

              // زرار القلب + add to cart
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BlocBuilder<FavoriteCubit, bool>(
                    builder: (context, isFav) {
                      return HeartButton(
                        isFavorite: isFav,
                        onTap: () {
                          context
                              .read<FavoriteCubit>()
                              .toggleFavorite(productId);
                          // هنا لو حابب تحذف من الليست بعد الـ delete
                          // ممكن تستدعي cubit برا الشاشة وتعمل refresh
                        },
                      );
                    },
                  ),
                  SizedBox(height: AppSize.s14),
                  AddToCartButton(
                    onPressed: () {
                      // TODO: add product to cart
                    },
                    text: AppConstants.addToCart,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

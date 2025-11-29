import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Routes/Routes.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item_details.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.finalPrice,
    this.salePrice,
    required this.productId,
  });

  final String imageUrl;
  final String title;
  final num rating;
  final num finalPrice;
  final num? salePrice;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetails,
          arguments: productId,
        );
      },
      child: Container(
        height: 135,
        padding: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorManager.primary.withOpacity(.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // IMAGE
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorManager.primary.withOpacity(.6)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  width: 120,
                  height: 135,
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

            // DETAILS
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: FavouriteItemDetails(
                  title: title,
                  rating: rating,
                  finalPrice: finalPrice,
                  salePrice: salePrice,
                ),
              ),
            ),

            // ACTIONS
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeartButton(
                  onTap: () {
                    // Remove from favourite
                  },
                ),
                const SizedBox(height: 14),
                AddToCartButton(
                  onPressed: () {},
                  text: AppConstants.addToCart,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

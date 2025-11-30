import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Routes/Routes.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/favorite_cubit.dart';
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
          height: 135,
          padding: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
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
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: ColorManager.primary.withOpacity(.6),
                  ),
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

            
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: FavouriteItemDetails(
                    title: title,
                    finalPrice: finalPrice,
                    salePrice: salePrice,
                    rating: rating,
                  ),
                ),
              ),

  
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
                        
                        },
                      );
                    },
                  ),
                  SizedBox(height: 14),
              
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

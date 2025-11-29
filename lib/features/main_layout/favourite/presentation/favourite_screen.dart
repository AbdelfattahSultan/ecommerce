import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/favorite_state.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/getFav/getFav_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFavCubit()..getFavProducts(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s14.w,
          vertical: AppSize.s10.h,
        ),
        child: BlocBuilder<GetFavCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoriteError) {
              return Center(child: Text(state.message));
            } else if (state is FavoriteSuccess) {
              var favoriteProducts = state.products;
              return ListView.builder(
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  var product = favoriteProducts[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                    child: FavoriteItem(
                      imageUrl: product.imageCover ?? "",
                      title: product.title ?? "",
                      rating: product.ratingsAverage ?? 0,
                      finalPrice: product.price ?? 0,
                      productId: product.id ?? "",
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('No favorites added yet.'));
          },
        ),
      ),
    );
  }
}

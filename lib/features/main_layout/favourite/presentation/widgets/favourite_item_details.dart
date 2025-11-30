import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/custom_txt_widget.dart';
import 'package:flutter/material.dart';

class FavouriteItemDetails extends StatelessWidget {
  const FavouriteItemDetails({
    super.key,
    required this.title,
    required this.finalPrice,
    this.salePrice,
    required this.rating,
  });

  final String title;
  final num finalPrice;
  final num? salePrice;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        /// Title
        CustomTextWgt(
          data: title,
          textStyle: getSemiBoldStyle(
            color: ColorManager.primaryDark,
            fontSize: 18,
          ),
        ),

        /// Rating
        Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: ColorManager.starRateColor,
              size: 18,
            ),
            SizedBox(width: 4),
            CustomTextWgt(
              data: rating.toString(),
              textStyle: getMediumStyle(
                color: ColorManager.primaryDark,
                fontSize: 14,
              ),
            ),
          ],
        ),

        /// Price Row
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP $finalPrice  ',
              textStyle: getSemiBoldStyle(
                color: ColorManager.primaryDark,
                fontSize: 18,
              ),
            ),

            if (salePrice != null)
              Flexible(
                child: CustomTextWgt(
                  data: 'EGP $salePrice',
                  textStyle: getMediumStyle(
                    color: ColorManager.appBarTitleColor.withOpacity(.6),
                    fontSize: 10,
                  ).copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

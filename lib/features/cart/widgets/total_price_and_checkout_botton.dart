import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceAndCheckoutBotton extends StatelessWidget {
  const TotalPriceAndCheckoutBotton(
      {super.key, required this.totalPrice, required this.checkoutButtonOnTap});
  final int totalPrice;
  final void Function() checkoutButtonOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Total price',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(
                color: ColorManager.textColor.withOpacity(0.6),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 90.w,
              child: Text(
                'EGP $totalPrice',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getMediumStyle(
                  color: ColorManager.textColor,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 18.h),

        // Checkout button ================================
        Expanded(
          child: CustomElevatedButton(
            label: 'Check Out',
            onTap: checkoutButtonOnTap,
            suffixIcon: Icon(
              Icons.arrow_forward,
              color: ColorManager.white,
            ),
          ),
        )
      ],
    );
  }
}

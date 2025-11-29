import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';

import 'package:ecommerce_app/features/cart/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CartItemWidget(
                  imagePath: ImageAssets.categoryCardImage,
                  title: 'Nike Air Jordon',
                  price: 1500,
                  quantity: 1,
                  onDeleteTap: () {},
                  onDecrementTap: (value) {},
                  onIncrementTap: (value) {},
                  size: 40,
                  color: Colors.black,
                  colorName: 'Black',
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: 12),
                itemCount: 2,
              ),
            ),

            TotalPriceAndCheckoutBotton(
              totalPrice: 1200,
              checkoutButtonOnTap: () {},
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

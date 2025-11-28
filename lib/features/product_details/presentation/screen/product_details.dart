import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// ⭐ صورة واحدة بس
            const ProductSlider(
              items: [
                ProductItem(
                  imageUrl:
                      'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
                ),
              ],
              initialIndex: 0,
            ),

            const SizedBox(height: 24),

            /// ⭐ اسم المنتج + السعر
            const ProductLabel(
              productName: 'Nike Air Jordon',
              productPrice: 'EGP 3,500',
            ),

            const SizedBox(height: 16),

            /// ⭐ الريفيوهات
            const ProductRating(
              productBuyers: '3,230',
              productRating: '4.8 (7,500)',
            ),

            const SizedBox(height: 16),

            /// ⭐ الوصف
            const ProductDescription(
              productDescription:
                  'Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories',
            ),

            const SizedBox(height: 48),

            /// ⭐ السعر وزرار الإضافة للكارت
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
                      'EGP 3,500',
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
          ]),
        ),
      ),
    );
  }
}

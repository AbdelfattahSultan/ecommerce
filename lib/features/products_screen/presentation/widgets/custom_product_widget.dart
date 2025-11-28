import 'package:ecommerce_app/core/Routes/Routes.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;

  const CustomProductWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
  });

  bool get isNetworkImage {
    return image.startsWith('http://') || image.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {

    double cardWidth = MediaQuery.of(context).size.width / 2 - 24;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetails);
      },
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withOpacity(0.3),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // صورة المنتج
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child: SizedBox(
                    height: 130,
                    width: double.infinity,
                    child: isNetworkImage
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.broken_image),
                              );
                            },
                          )
                        : Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: HeartButton(onTap: () {}),
                ),
              ],
            ),

            // التفاصيل
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان
                  Text(
                    title,
                    style: getMediumStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // الوصف
                  Text(
                    description,
                    style: getRegularStyle(
                      color: ColorManager.textColor,
                      fontSize: 12.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP $price",
                        style: getRegularStyle(
                          color: ColorManager.textColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "$discountPercentage %",
                        style: getTextWithLine(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // الريفيو وزرار +
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Review ($rating)",
                            style: getRegularStyle(
                              color: ColorManager.textColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Icon(
                            Icons.star_rate_rounded,
                            color: ColorManager.starRateColor,
                            size: 18,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

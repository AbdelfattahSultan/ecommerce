import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomCategoryWidget extends StatelessWidget {
  final String? categoryName;
  final String? categoryImage;
  final VoidCallback? onTap;

  const CustomCategoryWidget({
    super.key,
    this.categoryName,
    this.categoryImage, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasNetworkImage = categoryImage != null && categoryImage!.isNotEmpty;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: hasNetworkImage
                  ? CachedNetworkImage(
                      imageUrl: categoryImage!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    )
                  : Image.asset(
                      ImageAssets.categoryHomeImage,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 90,
            child: Text(
              categoryName ?? "",
              style: getRegularStyle(
                color: ColorManager.darkBlue,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

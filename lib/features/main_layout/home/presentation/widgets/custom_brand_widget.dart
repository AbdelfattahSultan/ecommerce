import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  final String? brandImage;
  final String? brandName;

  const CustomBrandWidget({super.key, this.brandImage, this.brandName});

  @override
  Widget build(BuildContext context) {
    final hasNetworkImage = brandImage != null && brandImage!.isNotEmpty;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: hasNetworkImage
                ? CachedNetworkImage(
                    imageUrl: brandImage!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  )
                : Image.asset(
                    ImageAssets.brandHomeImage,
                    fit: BoxFit.scaleDown,
                  ),
          ),
        ),

        SizedBox(height: 8),

        SizedBox(
          width: 90,
          child: Text(
            brandName ?? "",
            style: getRegularStyle(
              color: ColorManager.darkBlue,
              fontSize: 14.sp,
            ),
            maxLines: 2,
            overflow: TextOverflow.visible,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

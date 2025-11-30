import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class HeartButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onTap;

  const HeartButton({
    super.key,
    required this.isFavorite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final heartIcon = isFavorite
        ? IconsAssets.icClickedHeart
        : IconsAssets.icHeart;

    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: onTap,
      child: Material(
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ImageIcon(
            AssetImage(heartIcon),
            color: ColorManager.primary,
          ),
        ),
      ),
    );
  }
}

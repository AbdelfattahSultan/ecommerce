import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.productDescription});

  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: getMediumStyle(
            color: ColorManager.appBarTitleColor,
          ).copyWith(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          productDescription,
          style: getMediumStyle(
            color: ColorManager.appBarTitleColor,
          ).copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

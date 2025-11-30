import 'package:ecommerce_app/core/Routes/Routes.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
 final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading??false,
      title: SvgPicture.asset(
        SvgAssets.routeLogo,
        height: 25.h,
        width: 25.w,
        colorFilter:
            const ColorFilter.mode(ColorManager.textColor, BlendMode.srcIn),
      ),
      bottom: PreferredSize(
          preferredSize: const Size(100, 60),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: ColorManager.primary,
                    style: getRegularStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 1, color: ColorManager.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                               color: ColorManager.primary)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                               color: ColorManager.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                            color: ColorManager.primary)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                             color: ColorManager.error)),
                      prefixIcon: ImageIcon(
                        AssetImage(IconsAssets.icSearch),
                        color: ColorManager.primary,
                      ),
                      hintText: "what do you search for?",
                      hintStyle: getRegularStyle(
                          color: ColorManager.primary, fontSize: FontSize.s16),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.cartRoute),
                    icon: ImageIcon(
                      AssetImage(IconsAssets.icCart),
                      color: ColorManager.primary,
                    ))
              ],
            ),
          )),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}

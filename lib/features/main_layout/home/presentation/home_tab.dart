import 'dart:async';

import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/brand_cubit/brand_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/brand_cubit/brand_state.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/category_cubit/category_state.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // Manual Di injection

  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()..fetchCategories()),
        BlocProvider(create: (context) => BrandCubit()..fetchBrands()),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAdsWidget(
              adsImages: adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoryError) {
                      return Center(child: Text(state.message));
                    } else if (state is CategorySuccess) {
                      final categories = state.categories;

                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                              categoryImage: categories[index].image,
                              categoryName: categories[index].name,
                            );
                          },
                          itemCount: categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                        ),
                      );
                    }
                    return const Center(child: Text('No categories found'));
                  },
                ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                BlocBuilder<BrandCubit, BrandState>(
                  builder: (context, state) {
                    if (state is BrandLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is BrandError) {
                      return Center(child: Text(state.message));
                    } else if (state is BrandsSuccess) {
                      var brands = state.brands;
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomBrandWidget(
                              brandImage: brands[index].image,
                              brandName: brands[index].name,
                            );
                          },
                          itemCount: 20,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                        ),
                      );
                    }
                    return const Center(child: Text('No brands found'));
                  },
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

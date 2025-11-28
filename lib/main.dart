
import 'package:ecommerce_app/core/Routes/Routes.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/cart/screens/cart_screen.dart';
import 'package:ecommerce_app/features/main_layout/main_layout.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        routes: {
          Routes.cartRoute: (context) => const CartScreen(),
          Routes.mainRoute: (context) => const MainLayout(),
          Routes.productsScreenRoute: (context) => const ProductsScreen(),
          Routes.productDetails: (context) => const ProductDetails(),
          Routes.signInRoute: (context) => const SignInScreen(),
          Routes.signUpRoute: (context) => const SignUpScreen(),
        },
        initialRoute: Routes.signInRoute,
      ),
    );
  }
}

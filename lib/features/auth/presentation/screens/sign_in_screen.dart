import 'package:ecommerce_app/core/Routes/Routes.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'sulta@gmail.com');
  final _passwordController = TextEditingController(text: 'Ahmed@123');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login successfully ")),
                );
                Navigator.pushNamed(context, Routes.mainRoute);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:40),
                        Center(
                          child: Image.asset(
                            "assets/images/logoApp.png",
                            height: 150,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 40),

                        Text(
                          'Welcome Back',
                          style: getBoldStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s24.sp),
                        ),
                        Text(
                          'Please sign in with your mail',
                          style: getLightStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s16.sp),
                        ),

                        SizedBox(height: 50),

                        BuildTextField(
                          controller: _emailController,
                          backgroundColor: ColorManager.white,
                          hint: 'enter your email',
                          label: 'email',
                          textInputType: TextInputType.emailAddress,
                          validation: AppValidators.validateEmail,
                        ),

                        SizedBox(height: 28),

                        BuildTextField(
                          controller: _passwordController,
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'Password',
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),

                        SizedBox(height: 60),

                        Center(
                          child: SizedBox(
                            child: (state is AuthLoading)
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CustomElevatedButton(
                                    isStadiumBorder: false,
                                    label: 'Login',
                                    backgroundColor: ColorManager.white,
                                    textStyle: getBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: 18,
                                    ),
                                    onTap: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        context.read<AuthCubit>().login(
                                          _emailController.text,
                                          _passwordController.text,
                                        );
                                      }
                                    },
                                  ),
                          ),
                        ),

                        SizedBox(height: 30.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: getSemiBoldStyle(
                                color: ColorManager.white,
                              ).copyWith(fontSize: FontSize.s16.sp),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.signUpRoute,
                              ),
                              child: Text(
                                'Create Account',
                                style: getSemiBoldStyle(
                                  color: ColorManager.white,
                                ).copyWith(fontSize: FontSize.s16.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

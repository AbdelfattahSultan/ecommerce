import 'package:ecommerce_app/core/Routes/Routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Account created successfully "),
                  ),
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
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSize.s40.h),
                        Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                        SizedBox(height: AppSize.s40.h),
                        BuildTextField(
                          backgroundColor: ColorManager.white,
                          hint: 'enter your full name',
                          label: 'Full Name',
                          textInputType: TextInputType.name,
                          validation: AppValidators.validateFullName,
                          controller: nameController,
                        ),
                        SizedBox(height: AppSize.s18.h),
                        BuildTextField(
                          hint: 'enter your mobile no.',
                          backgroundColor: ColorManager.white,
                          label: 'Mobile Number',
                          validation: AppValidators.validatePhoneNumber,
                          textInputType: TextInputType.phone,
                          controller: phoneController,
                        ),
                        SizedBox(height: AppSize.s18.h),
                        BuildTextField(
                          controller: emailController,
                          hint: 'enter your email address',
                          backgroundColor: ColorManager.white,
                          label: 'E-mail address',
                          validation: AppValidators.validateEmail,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: AppSize.s18.h),
                        BuildTextField(
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'password',
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                          controller: passwordController,
                        ),
                        SizedBox(height: AppSize.s50.h),
                        Center(
                          child: SizedBox(
                            height: AppSize.s60.h,
                            width: MediaQuery.of(context).size.width * .9,
                            child: (state is AuthLoading)
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CustomElevatedButton(
                                    // borderRadius: AppSize.s8,
                                    label: 'Sign Up',
                                    backgroundColor: ColorManager.white,
                                    textStyle: getBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: AppSize.s20,
                                    ),
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().register(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text,
                                        );
                                      }
                                    },
                                  ),
                          ),
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

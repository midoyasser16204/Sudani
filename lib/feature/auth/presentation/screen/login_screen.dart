import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sudani_app/core/routes/route_center.dart';
import 'package:sudani_app/core/widgets/app_snack_bar.dart';
import 'package:sudani_app/core/widgets/border_button.dart';
import 'package:sudani_app/core/widgets/main_container.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/cubit/locale_cubit.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/background_container.dart';
import '../../../../core/widgets/custom_text_input_field.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../generated/l10n.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widget/auth_header.dart';
import '../widget/forgot_password_navigator.dart';
import '../widget/language_switcher.dart';
import '../widget/or_divider.dart';
import '../widget/signup_navigator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = getIt<AuthCubit>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authCubit.close();
    super.dispose();
  }

  void _toggleLanguage() {
    getIt<LocaleCubit>().toggleLocale();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      _authCubit.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  void _handleGoogleLogin() {
    _authCubit.loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    final localeCubit = getIt<LocaleCubit>();

    return BlocConsumer<AuthCubit, AuthState>(
      bloc: _authCubit,
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go(RouteCenter.layout);
        } else if (state is AuthError) {
          AppSnackBar.error(context, state.message);
        }
      },
      builder: (context, authState) {
        return BlocBuilder<LocaleCubit, Locale>(
          bloc: localeCubit,
          builder: (context, locale) {
            final isEnglish = locale.languageCode == Strings.eng;
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, _) {
                if (!didPop) SystemNavigator.pop();
              },
              child: Scaffold(
                body: BackgroundContainer(
                  child: Column(
                    children: [
                      LanguageSwitcher(
                        isEnglish: isEnglish,
                        onTap: _toggleLanguage,
                      ),
                      SizedBox(height: 40.h),
                      SvgPicture.asset(Assets.logo, width: 120.w, height: 120.h),
                      SizedBox(height: 40.h),
                      Expanded(
                        child: Stack(
                          children: [
                            MainContainer(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 40.h),
                                        const AuthHeader(),
                                        SizedBox(height: 32.h),
                                        CustomTextInputField(
                                          controller: _emailController,
                                          hintText: S.of(context).emailHint,
                                          labelText: S.of(context).emailTitle,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          validator: (value) =>
                                              Validator.validateField(value, ValidatorField.email, context),
                                        ),
                                        SizedBox(height: 20.h),
                                        CustomTextInputField(
                                          controller: _passwordController,
                                          hintText: S.of(context).passwordHint,
                                          labelText: S.of(context).passwordTitle,
                                          obscureText: true,
                                          textInputAction: TextInputAction.done,
                                          validator: (value) =>
                                              Validator.validateField(value, ValidatorField.password, context),
                                          onFieldSubmitted: (_) => _handleLogin(),
                                        ),
                                        SizedBox(height: 12.h),
                                        ForgotPasswordNavigator(
                                          isEnglish: isEnglish,
                                          onPressed: () {},
                                        ),
                                        SizedBox(height: 24.h),
                                        Center(
                                          child: GradientButton(
                                            text: S.of(context).login,
                                            onPressed: _handleLogin,
                                          ),
                                        ),
                                        SizedBox(height: 24.h),
                                        const OrDivider(),
                                        SizedBox(height: 24.h),
                                        Center(
                                          child: BorderButton(
                                            text: S.of(context).loginWithGoogle,
                                            iconPath: Assets.google,
                                            onPressed: _handleGoogleLogin,
                                          ),
                                        ),
                                        SizedBox(height: 32.h),
                                        SignupNavigator(onTap: () {}),
                                        SizedBox(height: 32.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (authState is AuthLoading)
                              Container(
                                color: Colors.black.withValues(alpha: 0.5),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
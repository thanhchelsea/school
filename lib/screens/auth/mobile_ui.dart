import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school_manager/screens/auth/controller.dart';
import 'package:school_manager/tools/text_style.dart';
import 'package:school_manager/utils/index.dart';
import 'package:school_manager/values/index.dart';
import 'package:school_manager/widgets/index.dart';
import '../../widgets/check_box.dart';

class AuthMobileUI extends StatelessWidget {
  AuthMobileUI({super.key, required this.controller});
  AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: largePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Expanded(flex: 4, child: _renderLoginUI(context))],
      ),
    );
  }

  Widget _renderLoginUI(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: largePadding),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLogo(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome to ${AppConfigs.appName}!",
                      style: Get.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    WidgetSpan(
                      child: SvgPicture.asset(
                        AppImages.wave,
                        width: 32,
                        // height: 24.w,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: halfPadding),
              Text(
                "Please sign-in to your account and start the adventure",
                style: Get.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Expanded(child: _renderTextInputLogin(context)),
        ],
      ),
    );
  }

  Widget _renderTextInputLogin(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: extraLargePadding),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextField(
              controller: controller.usernameTextEditCtrl,
              labelText: "Email or Username",
              hintText: "Enter your email or username",
              onChanged: (v) {},
              iconPrefix: const Icon(AppIcons.user),
              obscureText: false,
              validator: (p0) {
                return Validator().notEmpty(p0, 'username');
              },
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: controller.passwordTextEditCtrl,
              labelText: "Your password",
              hintText: "Enter your password",
              onChanged: (v) {},
              obscureText: true,
              iconPrefix: const Icon(AppIcons.lock),
              validator: (p0) {
                return Validator().notEmpty(p0, "password");
              },
            ),
            _renderAction(context),
          ],
        ),
      ),
    );
  }

  Widget _renderAction(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: padding12),
          AppCheckBox(label: "Remember Me"),
          SizedBox(height: largePadding),
          Center(
            child: PrimaryButton(
              labelText: "Sign in",
              onPressed: () {
                controller.signIn();
              },
              width: getSizeResponsive(defaultSize: 150, context: context),
            ),
          )
        ],
      ),
    );
  }
}

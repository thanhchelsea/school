import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:school_manager/screens/auth/controller.dart';
import 'package:school_manager/tools/text_style.dart';
import 'package:school_manager/utils/index.dart';
import 'package:school_manager/values/index.dart';
import 'package:school_manager/widgets/index.dart';
import '../../widgets/check_box.dart';

class AuthDesktopUI extends StatelessWidget {
  AuthDesktopUI({super.key, required this.controller});
  AuthController controller;
  @override
  Widget build(BuildContext context) {
    bool check = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return Container(
      padding: EdgeInsets.only(left: extraLargePadding, top: extraLargePadding, bottom: extraLargePadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.theme.cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          check
              ? Container()
              : Expanded(
                  flex: 5,
                  child: _renderDescriptionImage(context),
                ),
          Expanded(flex: 4, child: _renderLoginUI(context))
        ],
      ),
    );
  }

  Widget _renderDescriptionImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(extraLargePadding * 2),
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
        ),
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Get.theme.cardColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 12,
                      offset: Offset(0, 15),
                      color: AppColors.primary.withOpacity(0.5),
                    )
                  ],
                ),
                child: Image(
                  image: const AssetImage(AppImages.eLearning),
                  width: getSizeResponsive(defaultSize: 500, context: context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderLoginUI(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: largePadding),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLogo(),

                      RichText(
                          text: TextSpan(children: [
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
                      ])),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Expanded(
                      //       child: Text(
                      //         "Welcome to ${AppConfigs.appName}!",
                      //         style: Get.theme.textTheme.headlineSmall?.copyWith(
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //     ),
                      //     SvgPicture.asset(
                      //       AppImages.wave,
                      //       width: 32,
                      //       // height: 24.w,
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: halfPadding),
                      Text(
                        "Please sign-in to your account and start the adventure",
                        style: Get.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: extraLargePadding),
                  _renderActionLogin(context),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _renderActionLogin(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            width: getSizeResponsive(
              context: context,
              defaultSize: 220,
              mobileSize: 220,
              tabletSize: 350,
              desktopSize: 350,
            ),
          ),
          SizedBox(height: 12),
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
            width: getSizeResponsive(
                context: context, defaultSize: 220, mobileSize: 220, tabletSize: 350, desktopSize: 350),
          ),
          SizedBox(height: padding12),
          AppCheckBox(label: "Remember Me"),
          SizedBox(height: largePadding),
          PrimaryButton(
            labelText: "Sign in",
            onPressed: () {
              controller.signIn();
            },
            width: getSizeResponsive(defaultSize: 150, context: context),
          )
        ],
      ),
    );
  }
}

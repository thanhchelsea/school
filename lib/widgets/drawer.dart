import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_manager/models/index.dart';
import 'package:school_manager/screens/auth/index.dart';
import 'package:school_manager/utils/index.dart';
import 'package:school_manager/values/index.dart';
import 'package:school_manager/widgets/index.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});
  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  final AuthController authCtrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: padding12,
          right: padding12,
          top: padding,
          bottom: padding,
        ),
        child: Column(
          children: [
            _renderProfile(),
            SizedBox(height: largePadding),
            Expanded(child: _renderFeature()),
            _renderAppVersion(),
          ],
        ),
      ),
    );
  }

  Widget _renderProfile() {
    return Obx(() {
      if (authCtrl.user.value == null) return const SizedBox();
      var user = authCtrl.user.value!;
      return Container(
        child: Row(
          children: [
            DefaultAvatar(
              gender: user.gender,
              radius: 24,
              backgroundColor: Get.theme.colorScheme.primary.withOpacity(0.2),
            ),
            SizedBox(width: padding12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.getFullName(),
                    // maxLines: 1,
                    style: Get.theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: halfPadding),
                  Text(
                    user.email,
                    // maxLines: 1,
                    style: Get.theme.textTheme.bodyMedium?.copyWith(
                      // fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _renderFeature() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: halfPadding),
      child: Column(
        children: [
          _renderItemAction(
            iconData: AppIcons.logout,
            name: "Logout",
            onTap: () {
              authCtrl.signOut();
            },
          ),
        ],
      ),
    );
  }

  Widget _renderItemAction({required IconData iconData, required String name, Function? onTap}) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: padding12),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 20,
            ),
            SizedBox(width: padding),
            Expanded(
              child: Text(
                name,
                style: Get.theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderAppVersion() {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: AppConfigs.appName + " ",
            style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
          ),
          TextSpan(
            text: AppConfigs.appVersion,
            style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
          ),
        ],
      ),
    );
  }
}

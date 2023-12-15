import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school_manager/models/user.dart';
import 'package:school_manager/utils/client_utils.dart';
import 'package:school_manager/widgets/index.dart';

import '../values/index.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget with PreferredSizeWidget, Utils {
  final String? appBarTitleText;
  Widget? appBarTitleWidget;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final bool showBackScreen;
  final double elevation;
  final Color? backgroundColor;
  final Function? onBack;
  final Widget? leading;
  final bool showAvatarDefault;
  final bool showDateForTitle;
  Function? onTapDrawer;

  CustomAppBar({
    Key? key,
    this.appBarTitleWidget,
    this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
    this.showBackScreen = true,
    this.elevation = 0,
    this.backgroundColor,
    this.onBack,
    this.leading,
    this.showAvatarDefault = false,
    this.showDateForTitle = false,
    this.onTapDrawer,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;
  var overlayStyle = SystemUiOverlayStyle.light; // 1

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: backgroundColor ?? Colors.white.withOpacity(0),
      centerTitle: false,
      elevation: elevation,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      actions: actions,
      titleSpacing: 0,
      title: Row(
        children: [
          leading == null
              ? showBackScreen
                  ? InkWell(
                      onTap: () {
                        if (onBack != null)
                          onBack!();
                        else
                          Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: const Icon(
                          Icons.navigate_before,
                          color: Colors.black,
                          size: 34,
                        ),
                      ),
                    )
                  : InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (onTapDrawer != null) {
                          onTapDrawer!();
                        }
                        // Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                        // padding: EdgeInsets.all(10),
                        padding: EdgeInsets.all(padding_6),
                        margin: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Get.theme.colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.4,
                              blurRadius: 7,
                              color: Get.theme.colorScheme.primaryContainer,
                            )
                          ],
                        ),
                        child: Icon(
                          Icons.menu_rounded,
                          size: 20,
                          color: Get.theme.colorScheme.primaryContainer,
                        ),
                      ),
                    )
              : Container(),
          SizedBox(width: padding),
          showDateForTitle
              ? Expanded(
                  child: Text(
                    dateToString(DateTime.now()),
                    style: Get.theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                )
              : Expanded(
                  child: appBarTitleText != null
                      ? Text(
                          appBarTitleText!,
                          style: Get.theme.textTheme.titleMedium,
                          textAlign: TextAlign.start,
                        )
                      : Container(),
                ),
          if (showAvatarDefault)
            DefaultAvatar(
              gender: Gender.Female,
              margin: EdgeInsets.only(right: halfPadding),
            )
        ],
      ),
    );
  }
}

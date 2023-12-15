import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:school_manager/base/index.dart';
import 'package:school_manager/base/responsive_layout.dart';
import 'package:school_manager/screens/home/index.dart';
import 'package:school_manager/screens/profile/view.dart';
import 'package:school_manager/values/index.dart';
import 'package:school_manager/widgets/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUIMobile extends StatelessWidget {
  HomeUIMobile({super.key});
  final homeCtrl = Get.find<HomeController>();
  final iconList = <IconData>[
    AppIcons.icon_home,
    AppIcons.calender,
    AppIcons.extra,
    AppIcons.document,
  ];

  List<Widget> bodies = [
    HomeTab(),
    Container(),
    Container(),
    ProfileUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar(),
      body: Obx(() => Container(padding: EdgeInsets.all(0), child: bodies[homeCtrl.bottomNavIndex])),
    );
  }

//  color: Color(0xFFFFBC10),

  Widget? bottomNavigationBar() {
    return Obx(
      () => AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: homeCtrl.bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        height: 60,
        activeColor: Get.theme.primaryColor,
        inactiveColor: Get.theme.colorScheme.primaryContainer,
        onTap: (index) {
          homeCtrl.setBottomNavIndex(index);
        },
        elevation: 1.5,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
      ),
    );
  }

  Widget? floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 3, color: AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        Icons.task_alt,
        size: 26,
      ),
      //params
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    return false;
  }
}

class HomeTab extends BaseView<HomeController> {
  Widget _renderMainFeatureHome() {
    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _renderItemMainFeature(
                  name: "Student",
                  image: AppImages.groupStudent,
                  height: 60,
                  backgroundColor: AppColors.background1,
                ),
              ),
              SizedBox(width: padding),
              Expanded(
                child: _renderItemMainFeature(
                  name: "Teacher",
                  height: 60,
                  image: AppImages.subjects,
                  backgroundColor: AppColors.background2,
                ),
              ),
            ],
          ),
          SizedBox(height: padding),
          Row(
            children: [
              // Expanded(
              //   child: _renderItemMainFeature(
              //     name: "Subject",
              //     image: AppImages.subjects,
              //     backgroundColor: AppColors.background3,
              //   ),
              // ),
              // SizedBox(width: padding),
              Expanded(
                child: _renderItemMainFeature(
                  height: 60,
                  name: "Class",
                  image: AppImages.classes,
                  backgroundColor: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: largePadding),
          CardApp(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: padding64),
            child: Text("ds"),
          ),
        ],
      ),
    );
  }

  Widget _renderItemMainFeature({
    required String name,
    required String image,
    Function? onTap,
    double? height,
    double? width,
    Color? backgroundColor,
  }) {
    return CardApp(
      backgroundColor: backgroundColor,
      shadowColor: backgroundColor?.withOpacity(0.2),
      padding: EdgeInsets.only(left: padding, right: padding, top: extraLargePadding, bottom: padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  style: Get.theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: padding10),
                Image(
                  image: AssetImage(image),
                  width: width,
                  height: height,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: halfPadding, right: halfPadding),
            child: Icon(
              AppIcons.next,
              size: 16,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      showBackScreen: false,
      showAvatarDefault: true,
      showDateForTitle: true,
      onTapDrawer: () {
        controller.toggleDrawer();
      },
    );
  }

  @override
  ResponsiveLayout body(BuildContext context) {
    // TODO: implement body
    return ResponsiveLayout(mobileUI: _renderMainFeatureHome(), desktopUI: Container());
  }
}

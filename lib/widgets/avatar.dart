import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:school_manager/models/index.dart';

import '../values/index.dart';

class DefaultAvatar extends StatelessWidget {
  DefaultAvatar({
    super.key,
    required this.gender,
    this.urlAvatar,
    this.radius = 16,
    this.backgroundColor,
    this.margin,
  });
  String? urlAvatar;
  double? radius;
  Color? backgroundColor;
  Gender gender;
  EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: margin,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: backgroundColor ?? Get.theme.colorScheme.primary.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 8,
                  color: Get.theme.colorScheme.primary.withOpacity(0.2),
                ),
              ]),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            foregroundImage: AssetImage(
              gender == Gender.Male ? AppImages.maleAvatarDefault : AppImages.femaleAvatarDefault,
            ),
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   right: 10,
        //   child: Icon(
        //     Icons.male,
        //     size: 12,
        //   ),
        // )
      ],
    );
  }
}

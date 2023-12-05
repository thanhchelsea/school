import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/values/index.dart';

class AppCheckBox extends StatefulWidget {
  AppCheckBox({super.key, required this.label});
  String label;
  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(width: 1.5, color: active ? Get.theme.primaryColor : AppColors.border),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          value: active,
          activeColor: Get.theme.primaryColor,
          onChanged: (v) {
            setState(() {
              active = v ?? false;
            });
          },
        ),
        const SizedBox(width: 0),
        Text(
          widget.label,
          style: Get.theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

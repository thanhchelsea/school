import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_manager/tools/text_style.dart';
import 'package:school_manager/values/app_colors.dart';

import '../values/index.dart';

class AppTextField extends StatefulWidget {
  AppTextField({
    super.key,
    required this.controller,
    this.iconPrefix,
    this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines,
    required this.onChanged,
    this.color,
    this.fontSize,
    this.enable = true,
    this.border,
    this.background,
    this.borderRadius,
    this.width,
    this.hintText,
  });
  final TextEditingController controller;
  final Widget? iconPrefix;
  final String? labelText;
  String? hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  bool obscureText;
  final int minLines;
  final int? maxLines;
  final void Function(String) onChanged;
  double? fontSize;
  Color? color;
  bool enable;
  Border? border;
  Color? background;
  double? borderRadius;
  double? width;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Text(
              widget.labelText!,
              style: Get.theme.textTheme.bodySmall!.copyWith(
                color: AppColors.black,
                fontSize: 12,
              ),
            ),
          SizedBox(height: padding_6),
          TextFormField(
            enabled: widget.enable,
            onTap: () {},
            style: TextStyle(fontSize: widget.fontSize ?? getSizeResponsive(defaultSize: 12)),
            decoration: InputDecoration(
              // fillColor: ,
              filled: true,
              errorText: null,
              hintText: widget.hintText,
              prefixIcon: widget.iconPrefix,
              suffixIcon: widget.obscureText
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          showText = !showText;
                        });
                      },
                      child: !showText
                          ? Icon(
                              Icons.remove_red_eye_outlined,
                              // color: AppColors.red,
                              size: 18,
                            )
                          : Icon(
                              FontAwesomeIcons.eyeSlash,
                              size: 14,
                            ),
                    )
                  : null,
            ),
            controller: widget.controller,
            onFieldSubmitted: (value) {},
            onChanged: (v) {},
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText ? showText : true,
            maxLines: 1,
            validator: (v) {
              return widget.validator!(v);
            },
          ),
        ],
      ),
    );
  }
}

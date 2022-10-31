import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';

class CustomMaterialBtton extends StatelessWidget {
  const CustomMaterialBtton({
    required this.onPressed,
    this.buttonText,
    this.textStyle,
    this.child,
    this.icon,
    this.height = 40,
    this.fontSize,
    this.textColor,
    this.color,
    this.minWidth = double.infinity,
    this.padding,
    Key? key,
    this.fontWeight,
    this.borderRadius,
    this.borderColor,
    this.elevation,
    this.margin,
    this.isLoading = false,
  }) : super(key: key);
  final Widget? child;
  final String? buttonText;
  final Widget? icon;
  final double? fontSize;
  final Color? textColor;
  final Color? color;
  final double? minWidth;
  final double? height;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsets? margin;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: MaterialButton(
        height: height,
        minWidth: minWidth,
        onPressed: onPressed,
        color: color ?? primaryColor,
        splashColor: borderColor ?? primaryColor,
        elevation: elevation,
        shape: borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: borderRadius!,
                side: BorderSide(color: borderColor ?? primaryColor))
            : StadiumBorder(
                side: BorderSide(color: borderColor ?? primaryColor)),
        child: SizedBox(
          height: height,
          child: isLoading
              ? Transform.scale(
                  scale: .6,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                )
              : child ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) icon!,
                      if (icon != null) kWidth10,
                      Text(
                        buttonText!,
                        style: textStyle ??
                            TextStyle(
                              color: textColor ?? kWhite,
                              fontSize: fontSize ?? 14.sp,
                              fontWeight: fontWeight ?? FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}

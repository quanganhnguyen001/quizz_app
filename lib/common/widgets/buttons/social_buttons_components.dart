import 'package:flutter/material.dart';

class SocialButtonsComponents extends StatelessWidget {
  const SocialButtonsComponents({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
    this.radius,
    this.icon,
    this.iconColor,
    this.padding,
    this.margin,
  });
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? radius;
  final Widget? icon;
  final Color? iconColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius ?? 8)),
        child: icon,
      ),
    );
  }
}

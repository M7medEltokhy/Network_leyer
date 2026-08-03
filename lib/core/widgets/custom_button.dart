import 'package:flutter/material.dart';
import 'package:network_leyer/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.border,
    this.title,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.color,
    this.textColor,
    this.borderColor,
    this.borderWidth,
  });

  final VoidCallback onTap;
  final String? title;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final double height;
  final double width;
  final double border;
  final double? borderWidth;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1,
          ),
          borderRadius: BorderRadius.circular(border),
          color: color,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixWidget != null) ...[
                prefixWidget!,
                SizedBox(width: 8),
              ] else if (prefixIcon != null) ...[
                Icon(prefixIcon, color: textColor ?? Colors.white),
                SizedBox(width: 8),
              ],

              if (title != null)
                CustomText(
                  text: title!,
                  size: 18,
                  color: textColor ?? Colors.white,
                ),

              if (suffixIcon != null) ...[
                SizedBox(width: 8),
                Icon(suffixIcon, color: textColor ?? Colors.white),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

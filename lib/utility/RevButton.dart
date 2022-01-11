import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';



class RevButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TextStyle textStyle;
  final Color color;
  final double height;
  final double width;
  final double radius;
  final Widget child;
  final Color borderColor;
  const RevButton({
    this.onTap,
    this.text,
    this.padding,
    this.margin,
    this.textStyle,
    this.color,
    this.child,
    this.height,
    this.width,
    this.radius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 44.0,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? AppColors.colorPrimary,
          borderRadius: BorderRadius.circular(radius??16.0),
          border: Border.all(
            width: 1.0,
            color: borderColor
          )
        ),
        child: child ??
            Center(
              child: Text(
                '$text',
                style: textStyle ?? textStyleRedRegular12px,
              ),
            ),
      ),
    );
  }
}

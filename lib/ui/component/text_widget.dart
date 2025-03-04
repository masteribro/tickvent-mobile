import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/ui_helpers.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.color,
    this.fontStyle,
    this.weight,
    this.overflow,
    this.selectable = false,
    this.style,
    this.height,
    this.fontSize,
    this.decoration,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
    this.softWrap,
    this.fontFamily,
  }) : super(key: key);
  final Color? color;
  final bool? softWrap;
  final String text;
  final String? fontFamily;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final bool selectable;
  final int? maxLines;
  final double? height;

  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    var textStyle = style == null
        ? kDefaultTextStyle.copyWith(
            color: color,
            fontWeight: weight,
            decoration: decoration,
            height: height,
            fontSize: fontSize ?? 14.sp,
            fontStyle: fontStyle,
            fontFamily: fontFamily ?? "Proxima Nova",
            letterSpacing: letterSpacing ?? -0.5,
          )
        : style!.copyWith(
            color: color,
            fontSize: fontSize ?? 14.sp,
            fontStyle: fontStyle,
            height: height,
            decoration: decoration,
            fontWeight: weight,
            letterSpacing: letterSpacing ?? -0.5,
          );
    if (selectable) {
      return SelectableText(
        text,
        style: textStyle,
        textAlign: textAlign,
        maxLines: maxLines,
      );
    }
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

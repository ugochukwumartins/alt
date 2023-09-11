import 'package:altinvestv2/styles/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.actionText,
      this.style,
      this.color,
      this.fillColor,
      this.radius,
      this.width,
      this.height,
      this.disabled = false,
      this.disabledColor,
      this.hasShadow = false,
      this.hasGradient = false,
      this.outLineColor,
      this.isOutline = false,
      this.hasTrailing = false,
      required this.onTap})
      : super(key: key);
  final String actionText;
  final Color? color;
  final Color? fillColor;
  final Color? outLineColor;
  final bool isOutline;
  final bool disabled;
  final Color? disabledColor;
  final double? width;
  final double? height;
  final TextStyle? style;
  final double? radius;
  final bool hasShadow;
  final bool hasGradient;
  final bool hasTrailing;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled) {
          HapticFeedback.heavyImpact();
          onTap!();
        }
      },
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 48,
        decoration: BoxDecoration(
            color: disabled
                ? disabledColor ?? Theme.of(context).disabledColor
                : (isOutline
                    ? Colors.transparent
                    : fillColor ?? Theme.of(context).primaryColor),
            boxShadow: hasShadow
                ? [
                    BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 0,
                        offset: const Offset(0, 15),
                        color: Theme.of(context)
                            .secondaryHeaderColor
                            .withOpacity(0.15))
                  ]
                : null,
            gradient: hasGradient ? AppGradients.buttonGradient : null,
            border: isOutline
                ? Border.all(
                    color: outLineColor ??
                        color ??
                        Theme.of(context).canvasColor.withOpacity(.9))
                : null,
            borderRadius: hasTrailing
                ? BorderRadius.only(
                    topLeft: Radius.circular(radius ?? 5),
                    bottomLeft: Radius.circular(radius ?? 5),
                  )
                : BorderRadius.circular(radius ?? 5)),
        alignment: Alignment.center,
        child: Text(
          actionText,
          style: style ??
              Theme.of(context).primaryTextTheme.button?.copyWith(
                  color: isOutline
                      ? color ?? Theme.of(context).canvasColor.withOpacity(.9)
                      : null),
        ),
      ),
    );
  }
}

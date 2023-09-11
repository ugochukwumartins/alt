import 'package:altinvestv2/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonWithIcons extends StatelessWidget {
  ButtonWithIcons({
    super.key,
    required this.text,
    this.isLeading = false,
    this.isTrailing = false,
    this.textColor,
    this.leadIcon,
    this.trailingIcon,
    this.fillColor,
    this.iconcolor,
  });
  bool isLeading;
  bool isTrailing;
  Color? textColor;
  Color? fillColor;
  Color? iconcolor;
  String text;
  String? leadIcon;
  String? trailingIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(MediaQuery.sizeOf(context).height);
        print(MediaQuery.sizeOf(context).width);
      },
      child: Container(
        width: isLeading
            ? MediaQuery.sizeOf(context).width / 3
            : MediaQuery.sizeOf(context).width / 3,
        height: MediaQuery.sizeOf(context).height / 19.07,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(color: AppColors.gray5),
            color: fillColor ?? AppColors.creamWhite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLeading
                ? SvgPicture.asset(
                    leadIcon!,
                    color: iconcolor,
                    height: MediaQuery.sizeOf(context).height / 40,
                  )
                : const SizedBox.shrink(),
            isLeading
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width / 12.8,
                  )
                : const SizedBox(
                    width: 1,
                  ),
            Text(
              text,
              style: TextStyle(
                color: textColor ?? AppColors.black,
              ),
            ),
            isTrailing
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width / 12.8,
                  )
                : const SizedBox(
                    width: 1,
                  ),
            isTrailing
                ? SvgPicture.asset(
                    trailingIcon!,
                    color: iconcolor ?? AppColors.gray3,
                    height: MediaQuery.sizeOf(context).height / 40,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

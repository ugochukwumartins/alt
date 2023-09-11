import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/constants.dart';
import 'package:altinvestv2/utils/responsive.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSize appBar(BuildContext context,
    {Color? color,
    String? text,
    bool isText = false,
    Widget? trailing,
    bool showBackButton = true,
    Color? backgroundColor,
    double? fontSize,
    double? elevation}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(75),
    child: AppBar(
      leadingWidth: 40,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: ySpaceMid, top: ySpace1),
              child: InkWell(onTap: () {}, child: Icon(Icons.arrow_back_ios)
                  // SvgPicture.asset(
                  //   backarrow,
                  //   height: 50,
                  //   width: 2,
                  //   color: color ?? AppColors.black,
                  // ),
                  ),
            )
          : null,
      title: SizedBox(
        width: SizeConfig.xMargin(context, 70),
        child: Padding(
          padding: const EdgeInsets.only(top: ySpace1),
          child: isText
              ? Text(
                  text!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: color ?? Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize),
                )
              : SvgPicture.asset(logo),
        ),
      ),
      actions: trailing != null
          ? [
              Padding(
                padding: const EdgeInsets.only(
                    right: 24, bottom: 5, top: ySpace1 + 5),
                child: trailing,
              )
            ]
          : null,
      centerTitle: true,
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      elevation: elevation ?? 0.5,
    ),
  );
}

import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/constants.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AltinvestIconandtext extends StatelessWidget {
  const AltinvestIconandtext(
      {super.key,
      this.iconColor = AppColors.white,
      this.textColor = AppColors.white,
      this.textColor2 = AppColors.white});

  final Color iconColor;

  final Color textColor;
  final Color textColor2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                logo,
                color: iconColor,
              ),
              RichText(
                text: TextSpan(
                    text: 'alt',
                    style: const TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 53),
                    children: [
                      TextSpan(
                        text: 'invest',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 53),
                      )
                    ]),
              )
            ],
          ),
        ),
        const SizedBox(
          height: ySpace1,
        ),
        Text(
          "Your preferred investment platform",
          style: TextStyle(
            color: textColor2,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

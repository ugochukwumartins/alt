import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AltinvestFooter extends StatelessWidget {
  const AltinvestFooter({
    super.key,
    this.color = AppColors.white,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: MediaQuery.sizeOf(context).width / 5),
        child: Row(
          children: [
            SvgPicture.asset(
              copyRight,
              color: color,
            ),
            Text('2023 altinvest. All rights reserved',
                style: TextStyle(
                  color: color,
                )),
          ],
        ),
      ),
    );
  }
}

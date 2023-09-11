import 'package:altinvestv2/ReuasbleWidget/AltinvestFooter.dart';
import 'package:altinvestv2/ReuasbleWidget/AltinvestIconandtext.dart';
import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/constants.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: MediaQuery.sizeOf(context).height / 2.5,
            ),
            child: const AltinvestIconandtext(),
          ),
          const AltinvestFooter()
        ],
      ),
    );
  }
}

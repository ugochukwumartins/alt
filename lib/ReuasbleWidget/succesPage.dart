import 'package:altinvestv2/ReuasbleWidget/button.dart';
import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccesPage extends StatelessWidget {
  const SuccesPage({Key? key, required this.heading, required this.message})
      : super(key: key);
  final String heading;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CustomButton(
            width: MediaQuery.sizeOf(context).width / 1.2,
            fillColor: AppColors.black,
            actionText: "Complete",
            color: AppColors.black,
            onTap: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(succce),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 30,
            ),
            Center(
                child: Text(
              heading,
              style: const TextStyle(
                fontSize: 28,
              ),
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 60,
            ),
            Center(child: Text(message)),
          ],
        ),
      ),
    );
  }
}

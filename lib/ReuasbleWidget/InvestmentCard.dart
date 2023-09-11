import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

investmentCard(
  BuildContext context,
) {
  print(MediaQuery.sizeOf(context).width / 1.5);

  print(MediaQuery.sizeOf(context).height / 2.80);

  double miniPadi = MediaQuery.sizeOf(context).height / 2.80;

  return Container(
    width: MediaQuery.sizeOf(context).width / 1.5,
    height: MediaQuery.sizeOf(context).height / 2.80,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(color: AppColors.gray5),
        color: AppColors.creamWhite),
    child: Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        right: 10.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fixed Income',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: miniPadi / 27.24,
          ),
          SvgPicture.asset(investmentIcone),
          SizedBox(
            height: miniPadi / 27.24,
          ),
          const Text(
              'This is an investment of a low risk type, and it includes investment in real estate, ethical bond, sukuk bond.'),
          Padding(
            padding: EdgeInsets.only(top: miniPadi / 5.45),
            child: Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                    print('hello');
                  },
                  child: const Text(
                    'Invest',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.primary,
                      decorationColor: AppColors.primary,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

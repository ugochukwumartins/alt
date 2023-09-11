import 'package:altinvestv2/ReuasbleWidget/button.dart';
import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/constants.dart';
import 'package:altinvestv2/utils/responsive.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DialogWidgets {
  static Future dialog(
      BuildContext context, bool dismiss, String title, String content) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static Future showDialogFunc(context, String title, String content) {
    return showDialog(
      context: context,
      builder: (context) {
        print('hello ${MediaQuery.sizeOf(context).width}');
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Stack(
              alignment: Alignment(0.8, -0.8),
              children: [
                Container(
                  margin: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.white,
                    // gradient: boxGradient,
                  ),
                  padding: EdgeInsets.only(top: 350 / 14.59, bottom: 0),
                  width: 350,
                  height: 350,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Center(
                          child: Text(content),
                        ),
                        // SizedBox(
                        //   height: MediaQuery.sizeOf(context).width / 9.6,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(top: 350 / 8.75),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  width: MediaQuery.sizeOf(context).width / 3,
                                  fillColor: AppColors.black,
                                  actionText: "Back",
                                  isOutline: true,
                                  color: AppColors.black,
                                  onTap: () {
                                    Navigator.pop(context);
                                  }),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 50,
                              ),
                              CustomButton(
                                  width: MediaQuery.sizeOf(context).width / 3,
                                  fillColor: AppColors.black,
                                  actionText: "Confirm",
                                  color: AppColors.black,
                                  onTap: () {
                                    DialogWidgets.modalBottomSheetMenu(
                                        context, const Text(''), null);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      //perform action here.
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(cancel))
              ],
            ),
          ),
        );
      },
    );
  }

  static Future modalBottomSheetMenu(
      BuildContext context, Widget child, Function? ontap,
      {dismiss = true,
      double? height,
      double? minHeight,
      bool isScrollControlled = true,
      bool hasShadow = false,
      bool secondHasShadow = false,
      bool secondHasGradient = false,
      bool hasGradient = false,
      String buttonText = '',
      String secondButtonText = '',
      bool showButton = true,
      Function? onTapSecBtn,
      Color? outlineColor,
      Color? outlineTextColor,
      bool isSecondBTN = false,
      bool showCancelButton = true,
      bool removeSpace = false}) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        isDismissible: dismiss,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(bottomSheetBorderRadius),
          ),
        ),
        builder: (builder) {
          return Container(
              constraints: BoxConstraints(
                minHeight: minHeight ?? bottomSheetHeight, //
              ),
              height: height ?? bottomSheetHeight,
              padding: const EdgeInsets.symmetric(
                  horizontal: generalHorizontalPadding, vertical: ySpace1),
              margin: isScrollControlled
                  ? EdgeInsets.only(
                      bottom: MediaQuery.of(builder).viewInsets.bottom,
                    )
                  : null,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(bottomSheetBorderRadius),
                      topRight: Radius.circular(bottomSheetBorderRadius))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showCancelButton)
                      Row(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: SvgPicture.asset(cancel),
                          )
                          // SvgImage(asset: xIcon))
                        ],
                      ),
                    Center(child: child),
                    if (!removeSpace) Gap(SizeConfig.yMargin(context, 3)),
                    isSecondBTN == true
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CustomButton(
                                isOutline: true,
                                actionText: secondButtonText,
                                hasGradient: secondHasGradient,
                                hasShadow: secondHasShadow,
                                outLineColor: outlineColor,
                                color: outlineTextColor,
                                onTap: onTapSecBtn),
                          )
                        : const SizedBox.shrink(),
                    if (showButton)
                      CustomButton(
                          actionText: buttonText,
                          hasGradient: hasGradient,
                          hasShadow: hasShadow,
                          onTap: ontap),
                  ],
                ),
              ));
        });
  }
}

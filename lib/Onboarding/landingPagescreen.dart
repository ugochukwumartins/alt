import 'package:altinvestv2/ReuasbleWidget/AltinvestFooter.dart';
import 'package:altinvestv2/ReuasbleWidget/AltinvestIconandtext.dart';
import 'package:altinvestv2/ReuasbleWidget/ButtonWithIcons.dart';
import 'package:altinvestv2/ReuasbleWidget/InvestmentCard.dart';
import 'package:altinvestv2/ReuasbleWidget/alertDialog.dart';
import 'package:altinvestv2/ReuasbleWidget/appBar.dart';
import 'package:altinvestv2/ReuasbleWidget/button.dart';
import 'package:altinvestv2/ReuasbleWidget/check_box.dart';
import 'package:altinvestv2/ReuasbleWidget/customfield.dart';
import 'package:altinvestv2/ReuasbleWidget/nav_%20bar.dart';
import 'package:altinvestv2/ReuasbleWidget/succesPage.dart';
import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingPagescreen extends StatefulWidget {
  LandingPagescreen({Key? key}) : super(key: key);

  @override
  State<LandingPagescreen> createState() => _LandingPagescreenState();
}

class _LandingPagescreenState extends State<LandingPagescreen> {
  bool isSlected = false;
  int radioSelected = 1;

  bool isSwitchchecked = false;
  void checkVal(bool? val) {
    setState(() {
      isSlected = val!;
    });
  }

  void radioSelectedChanged(int? val) {
    setState(() {
      radioSelected = val!;
    });
  }

  swichChange(bool val) {
    setState(() {
      isSwitchchecked = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: customNavBar(context),

      appBar: appBar(
        context,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: MediaQuery.sizeOf(context).height / 10,
              ),
              child: const AltinvestIconandtext(
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
                textColor2: AppColors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 5,
            ),
            CustomField(
              headtext: 'create account',
              hint: 'user name',
              width: MediaQuery.sizeOf(context).width / 1.1,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 70,
            ),
            CustomField(
              hint: 'no hint',
              width: MediaQuery.sizeOf(context).width / 1.1,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 70,
            ),
            CustomField(
              hint: 'password',
              headtext: "password",
              obscureText: true,
              width: MediaQuery.sizeOf(context).width / 1.1,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 70,
            ),
            CustomField(
              hint: 'password',
              headtext: "password",
              obscureText: true,
              sIcon: const Icon(Icons.password),
              width: MediaQuery.sizeOf(context).width / 1.1,
            ),
            CustomField(
              hint: 'number',
              headtext: "number",
              obscureText: true,
              keyboardType: TextInputType.number,
              width: MediaQuery.sizeOf(context).width / 1.1,
            ),
            CustomField(
              hint: 'email',
              headtext: "email",
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              width: MediaQuery.sizeOf(context).width / 1.1,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 70,
            ),
            CustomButton(
                width: MediaQuery.sizeOf(context).width / 1.2,
                fillColor: AppColors.black,
                actionText: "Create Account",
                color: AppColors.black,
                onTap: () {
                  DialogWidgets.showDialogFunc(context, 'Confirm Details',
                      'Please confirm the date of Birth \n entered is the same as the one\n                   used for BVN');
                }),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 70,
            ),
            CustomButton(
              width: MediaQuery.sizeOf(context).width / 1.2,
              fillColor: AppColors.black,
              actionText: "Log in",
              isOutline: true,
              color: AppColors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SuccesPage(
                            heading: 'Set up Successful',
                            message: 'security queston Pin set up successfully',
                          )),
                );
              },
            ),
            customCheckBox(
              val: isSlected,
              onchanged: checkVal,
              color: AppColors.primary,
              checked: AppColors.white,
            ),
            customRadioButton(
                onChange: radioSelectedChanged, selectedOptions: radioSelected),
            const AltinvestFooter(
              color: AppColors.gray3,
            ),
            //  customSwitch(value: isSwitchchecked, onChanged: swichChange),
            CustomSwitch(
              value: isSwitchchecked,
              onChanged: swichChange,
            ),

            SizedBox(
              height: 40,
            ),
            ButtonWithIcons(
              text: "But why",
              leadIcon: notification,
              isLeading: true,
            ),
            ButtonWithIcons(
              text: "But why",
              trailingIcon: notification,
              isTrailing: true,
            ),
            SizedBox(
              height: 10,
            ),
            ButtonWithIcons(
              text: "But why",
              leadIcon: notification,
              isLeading: true,
              fillColor: AppColors.primary,
              textColor: AppColors.white,
              iconcolor: AppColors.white,
            ),
            SizedBox(
              height: 10,
            ),
            investmentCard(
              context,
            )
          ],
        ),
      ),
    );
  }
}

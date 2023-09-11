import 'package:altinvestv2/styles/app_colors.dart';
import 'package:flutter/material.dart';

customCheckBox(
    {required bool? val,
    required Function(bool? changeval) onchanged,
    Color? color,
    Color? checked}) {
  return Checkbox(
      value: val,
      side: val == false
          ? const BorderSide(
              color: AppColors.gray4,
            )
          : null,
      onChanged: onchanged,
      activeColor: color,
      checkColor: checked);
}

customRadioButton({Function(int?)? onChange, required int selectedOptions}) {
  return Column(
    children: [
      Radio(
        value: 1,
        groupValue: selectedOptions,
        onChanged: onChange,
        //activeColor: AppColors.red,
        fillColor: selectedOptions == 1
            ? MaterialStateProperty.all(AppColors.primary)
            : MaterialStateProperty.all(AppColors.gray4),
      ),
      Radio(
        value: 2,
        groupValue: selectedOptions,
        onChanged: onChange,
        //activeColor: AppColors.red,
        fillColor: selectedOptions == 2
            ? MaterialStateProperty.all(AppColors.primary)
            : MaterialStateProperty.all(AppColors.gray4),
      ),
    ],
  );
}

customSwitch({required bool value, required void Function(bool)? onChanged}) {
  return Switch(
    value: value,
    onChanged: onChanged,
    activeColor: AppColors.primary,
  );
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 55.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? AppColors.gray3
                  : AppColors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 25.0,
                  height: 30.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

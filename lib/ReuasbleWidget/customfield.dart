import 'package:altinvestv2/enums/text_field_type_enum.dart';
import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/app_helpers.dart';
import 'package:altinvestv2/utils/constants.dart';
import 'package:altinvestv2/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class CustomField extends StatelessWidget {
  CustomField(
      {Key? key,
      this.hint = '',
      this.width,
      this.height,
      this.sIcon,
      this.pIcon,
      this.obscureText = false,
      this.isWordField = true,
      this.maxline,
      this.controller,
      this.contentPadding,
      this.onChanged,
      this.hintstyle,
      this.hintColor,
      this.headtext,
      this.onTap,
      this.keyboardType,
      this.validate = true,
      this.readonly = false,
      this.autoFocus = false,
      this.fieldType,
      this.inputFormatters,
      this.maxLength,
      this.useNativeKeyboard = true,
      this.fillColor,
      this.onCompleted,
      this.showCursor = false,
      this.shape = BoxShape.rectangle,
      this.pinPutFieldCount = 0,
      this.focusNode,
      this.validator,
      this.mainAxisAlignment,
      this.obscuringCharacter,
      this.showCreamFill = true,
      this.showPinPrefilledWidget = true})
      : super(key: key);

  final bool showCreamFill;
  final bool showPinPrefilledWidget;
  final String? obscuringCharacter;
  final MainAxisAlignment? mainAxisAlignment;
  final Function(String)? onCompleted;
  final VoidCallback? onTap;
  final String hint;
  final _pinPutFocusNode = FocusNode();
  final Color? fillColor;
  final bool useNativeKeyboard;
  final double? width;
  final double? height;
  final Widget? sIcon;
  final Widget? pIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final Function? validator;
  final TextStyle? hintstyle;
  final Color? hintColor;
  final int? maxline;
  final String? headtext;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextFieldType? fieldType;
  final bool isWordField;
  final bool validate;
  final bool readonly;
  final bool showCursor;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool autoFocus;
  final BoxShape? shape;
  final FocusNode? focusNode;
  final int? pinPutFieldCount;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    var keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    final BoxDecoration pinPutDecoration = BoxDecoration(
      border: Border.all(
        color: fillColor ?? AppColors.black,
      ),
      shape: shape ?? BoxShape.rectangle,
      borderRadius: shape == BoxShape.circle ? null : BorderRadius.circular(2),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headtext == null
            ? const SizedBox.shrink()
            : Text(headtext!,
                style: Theme.of(context).primaryTextTheme.headline5?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? null
                        : AppColors.gray3)),
        SizeConfig.space,
        Expanded(
            flex: 0,
            //height: inputFieldHeight,
            child: isWordField
                ? SizedBox(
                    width: width,
                    height: height,
                    child: TextFormField(
                      onTap: onTap,
                      maxLines: maxline ?? 1,
                      maxLength: maxLength,
                      obscureText: obscureText,
                      controller: controller,
                      readOnly: readonly,
                      autofocus: false,
                      focusNode: focusNode,
                      scrollPadding:
                          EdgeInsets.only(bottom: keyboardHeight + 20),
                      enableSuggestions: true,
                      keyboardType: fieldType == TextFieldType.phone ||
                              fieldType == TextFieldType.bvn
                          ? TextInputType.phone
                          : fieldType == TextFieldType.pin ||
                                  fieldType == TextFieldType.amount
                              ? TextInputType.number
                              : keyboardType ?? TextInputType.text,
                      onChanged: onChanged,
                      inputFormatters: (fieldType == TextFieldType.phone ||
                              fieldType == TextFieldType.amount ||
                              fieldType == TextFieldType.accountNo ||
                              fieldType == TextFieldType.pin ||
                              fieldType == TextFieldType.bvn)
                          ? <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ]
                          : inputFormatters,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.primary,
                        )),
                        border: const OutlineInputBorder(),
                        counterText: "",
                        contentPadding: contentPadding,
                        filled: true,
                        fillColor: showCreamFill
                            ? AppColors.creamWhite.withOpacity(.1)
                            : readonly == true
                                ? fillColor ?? AppColors.gray5
                                : fillColor ??
                                    Theme.of(context).backgroundColor,
                        errorMaxLines: 6,
                        prefixIcon: pIcon != null
                            ? Padding(
                                padding: const EdgeInsets.all(ySpaceMid + 3),
                                child: pIcon,
                              )
                            : null,
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                              //width: 50,
                              color: AppColors.textField,
                            )),
                        suffixIcon: sIcon != null
                            ? Padding(
                                padding: const EdgeInsets.all(ySpaceMid),
                                child: sIcon,
                              )
                            : null,
                        hintText: hint,
                        hintStyle: hintstyle ??
                            const TextStyle(color: AppColors.black),
                      ),
                      validator: (val) {
                        if (fieldType == TextFieldType.refferal) return null;
                        if (val == null) return 'Invalid input';
                        if (validator == null) {
                          if (fieldType == TextFieldType.bvn) {
                            if (val.isEmpty) {
                              return 'Field cannot be empty';
                            } else if (val.trim().isEmpty) {
                              return "Field cannot be empty";
                            } else if (val.length < 11) {
                              return 'Invalid Entry';
                            } else if (int.tryParse(val) == null) {
                              return 'Invalid entry';
                            }
                            return null;
                          } else if (fieldType == TextFieldType.accountNo) {
                            if (val.isEmpty) {
                              return 'Field cannot be empty';
                            } else if (val.trim().isEmpty) {
                              return "Field cannot be empty";
                            } else if (val.length < 10) {
                              return 'Invalid Entry';
                            } else if (int.tryParse(val) == null) {
                              return 'Invalid entry';
                            }
                            return null;
                          } else if (fieldType == TextFieldType.pin) {
                            if (val.isEmpty) {
                              return 'Field cannot be empty';
                            } else if (val.trim().isEmpty) {
                              return "Field cannot be empty";
                            } else if (val.length < 4) {
                              return 'Invalid Entry';
                            } else if (int.tryParse(val) == null) {
                              return 'Invalid entry';
                            }
                            return null;
                          } else if (fieldType == TextFieldType.phone) {
                            if (val.isEmpty || val.trim().isEmpty) {
                              return 'Field must not be empty';
                            } else if (val.length < phoneNumberFieldLength) {
                              return 'Invalid entry';
                            } else if (int.tryParse(val.replaceAll('+', '')) ==
                                null) {
                              return 'Invalid entry';
                            }
                            return null;
                          } else {
                            if (validate) {
                              if (val.isEmpty &&
                                  (fieldType != TextFieldType.pin)) {
                                return "Field cannot be empty";
                              } else if (val.trim().isEmpty) {
                                return "Field cannot be empty";
                              } else if (fieldType == TextFieldType.amount) {
                                if (double.tryParse(val.replaceAll(',', '')) ==
                                    null) {
                                  return 'Enter a valid amount';
                                } else if (double.tryParse(
                                        val.replaceAll(',', ''))! <=
                                    0) {
                                  return 'Enter a valid amount';
                                }
                              } else if (fieldType == TextFieldType.email) {
                                bool isValidEmail = RegExp(
                                        r"[a-z0-9!#$%&'+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'+/=?^_`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                    .hasMatch(val);
                                return isValidEmail
                                    ? null
                                    : "Please provide a valid email address";
                              } else if (fieldType ==
                                  TextFieldType.setPassword) {
                                bool isValidPassword = val
                                    .isPasswordValid; //RegExp(r"^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[^\da-zA-Z]).{8,15}$").hasMatch(val);
                                return isValidPassword
                                    ? null
                                    : "Password must contain at least one special character,one number,\none lower case letter, one upper case letter and between 8 and\n15 characters long";
                              } else if (fieldType == TextFieldType.nin) {
                                if (val.isEmpty || val.trim().isEmpty) {
                                  return 'Field must not be empty';
                                } else if (val.length < 11) {
                                  return 'Invalid entry';
                                } else if (int.tryParse(val) == null) {
                                  return 'Invalid entry';
                                }
                                return null;
                              } else if (fieldType == TextFieldType.expiry) {
                                if (val.isEmpty || val.trim().isEmpty) {
                                  return 'Field must not be empty';
                                } else if (val.length < 5) {
                                  return 'Invalid entry';
                                } else if (!val.contains('/')) {
                                  return 'Invalid entry';
                                }
                                return null;
                              } else if (fieldType == TextFieldType.cvv) {
                                if (val.isEmpty || val.trim().isEmpty) {
                                  return 'Field must not be empty';
                                } else if (val.length < 3) {
                                  return 'Invalid entry';
                                }
                                return null;
                              }
                            }

                            return null;
                          }
                        } else {
                          validator!(val);
                        }
                        return null;
                      },
                    ),
                  )
                : Theme(
                    data: Theme.of(context).copyWith(
                        inputDecorationTheme: const InputDecorationTheme(
                      filled: false,
                    )),
                    child: Pinput(
                        length: pinPutFieldCount! > 0
                            ? pinPutFieldCount!.toInt()
                            : pinCodeFieldLength,
                        validator: (val) {
                          if (val == null) return 'Invalid input';
                          if (pinPutFieldCount! < 1
                              ? val.length < pinCodeFieldLength
                              : val.length < pinPutFieldCount!) {
                            return 'Complete the Pin Fields';
                          }
                          return null;
                        },
                        defaultPinTheme: PinTheme(
                            width: width ?? 45,
                            height: height ?? 50,
                            textStyle: Theme.of(context)
                                .primaryTextTheme
                                .headline3!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                            decoration: pinPutDecoration),
                        onCompleted: onCompleted,
                        obscuringCharacter: obscuringCharacter ?? '*', //●
                        mainAxisAlignment:
                            mainAxisAlignment ?? MainAxisAlignment.center,
                        obscureText: true,
                        controller: controller,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        autofocus: autoFocus,
                        focusNode: _pinPutFocusNode,
                        preFilledWidget: showPinPrefilledWidget
                            ? Container(
                                height: 35,
                                width: 30,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.5, color: AppColors.black),
                                  ),
                                ),
                              )
                            : null),
                  )),
      ],
    );
  }
}

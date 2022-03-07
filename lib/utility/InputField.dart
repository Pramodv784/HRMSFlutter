
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';


import 'Utility.dart';

/// Created by Pratik Kataria on 24-02-2021.

class InputField extends StatefulWidget {
  final String leftIcon;
  String rightIcon;
  final Function(String val) onTextChange;
  final String errorMessage;
  final String placeHolderText;
  final String text;
  final String titleText;
  final double radius;
  final InputType inputType;
  final int wordLimit;
  bool isPassword;
  TextCapitalization textCapitalization;

  InputField(
      {Key key,
      this.leftIcon,
      this.rightIcon,
      this.onTextChange,
      this.placeHolderText,
      this.errorMessage,
      this.radius,
      this.wordLimit,
      this.isPassword,
      this.inputType,
      this.titleText,
      this.text,
      this.textCapitalization})
      : super(key: key);

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  bool hasError = false;
  bool hasFocused = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) Text('${widget.titleText}', style: textStyleDark14px500w),
        if (widget.titleText != null) verticalSpace(6.0),
        FocusScope(
          child: Focus(
            onFocusChange: (focus) => setState(() => hasFocused = focus),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.dropbg,
                borderRadius: BorderRadius.circular(widget.radius ?? 3.0),
                border: Border.all(
                  width: 1.0,
                  color:AppColors.grey
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: Utility.screenWidth(context),
                height: 52.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
                child: Row(
                  children: [
                    if (widget.leftIcon != null)
                      SvgPicture.asset(
                        widget.leftIcon,
                        width: 15,
                        height: 15,
                        color: hasError ? AppColors.red : AppColors.iconColor,
                      ),
                    if (widget.leftIcon != null) horizontalSpace(12.0),
                    Expanded(
                        child: TextFormField(
                      obscureText: widget.isPassword ?? false,
                      keyboardType: getInputType(),
                      textAlign: TextAlign.left,
                      controller: _controller,

                      maxLines: 1, textInputAction: TextInputAction.next,
                      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,

                      style: hasError ? textStyleRed16px400w : textStyleDarkRegular16px400w,
                      decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: widget.placeHolderText,

                        hintStyle: hasError ? textStyleRed16px400w : textStyleRegular16px400w,
                        suffixStyle: TextStyle(color: AppColors.textColor),
                      ),
                      onChanged: (String val) {
                        widget.onTextChange(val);
                        resetErrorOnTyping();
                      },
                    )),
                    if (widget.rightIcon != null)
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: checkPasswordObscure,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Image.asset(
                            widget.rightIcon,
                            width: 15,
                            height: 15,
                            color: hasError ? AppColors.red : AppColors.black,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (hasError) verticalSpace(6.0),
        if (hasError)
          Row(
            children: [
              horizontalSpace(12.0),
              Text(
                widget.errorMessage ?? 'Should not be empty',
                style: textStyleErrorRedRegular12px,
              ),
            ],
          ),
      ],
    );
  }

  Color getBorderColor() {
    return hasError
        ? Colors.red
        : hasFocused
            ? AppColors.grey
            : Colors.transparent;
  }

  void showError({bool reset}) {
    setState(() {
      hasError = reset ?? true;
    });
  }

  void resetFocus() {
    setState(() => hasFocused = false);
  }

  void resetErrorOnTyping() {
    if (hasError) {
      setState(() {
        hasError = !hasError;
      });
    }
  }

  void checkPasswordObscure() {
      if (widget.placeHolderText.toLowerCase().contains('password')) {
      setState(() {
        widget.isPassword = !widget.isPassword;
        widget.rightIcon = widget.isPassword ? Images.PasswordEyeClose : Images.PasswordEyeOpen;
      });
    }
  }

  TextInputType getInputType() {
    switch (widget.inputType) {
      case InputType.PIN_CODE:
      case InputType.MOBILE:
        return TextInputType.number;
        break;
      case InputType.EMAIL:
        return TextInputType.emailAddress;
        break;
      case InputType.PASSWORD:
        return TextInputType.visiblePassword;
        break;
      case InputType.ONLY_WORDS:
        return TextInputType.name;
        break;
      default:
        return TextInputType.text;
        break;
    }
  }

/*  void resetText() {
    setState(() => {_controller.clear(), _currentFocus?.unfocus()});
  }*/

  List<TextInputFormatter> getInputFormatter() {
    switch (widget.inputType) {
      case InputType.MOBILE:
        return [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly];
        break;
      case InputType.PIN_CODE:
        return [LengthLimitingTextInputFormatter(6), FilteringTextInputFormatter.digitsOnly];
        break;
      case InputType.EMAIL:
      case InputType.PASSWORD:
      case InputType.ONLY_WORDS:
        return [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))];
        break;
      case InputType.NUMBER:
        return[FilteringTextInputFormatter.digitsOnly];
        break;
         case InputType.AMOUNT:
        return[FilteringTextInputFormatter.digitsOnly];
        break;

      default:
        return [LengthLimitingTextInputFormatter(250)];
        break;
    }
  }
}

enum InputType {
  MOBILE,
  EMAIL,
  PASSWORD,
  PIN_CODE,
  ONLY_WORDS,
  NUMBER,
  AMOUNT
}

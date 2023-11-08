import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/all_constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.leading,
    this.radius,
    this.onSubmitted,
    this.textInputType,
    this.inputFormatters,
    this.onChanged,
    this.isPassword = false,
    this.width,
    this.hintStyle,
    this.boxShadow,
    this.bgColor,
    this.height,
    this.borderColor,
    this.margin,
  });
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? leading;
  final double? radius;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isPassword;
  final double? width;
  final BoxShadow? boxShadow;
  final Color? bgColor;
  final double? height;
  final Color? borderColor;
  final EdgeInsets? margin;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ?? 48.h,
      alignment: Alignment.center,
      margin: widget.margin,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: widget.bgColor ?? AppColors.primaryColor,
        boxShadow: widget.boxShadow != null ? [widget.boxShadow!] : null,
        borderRadius: BorderRadius.circular(widget.radius ?? 12.r),
        border: widget.borderColor != null
            ? Border.all(color: widget.borderColor!)
            : null,
      ),
      child: TextField(
        obscureText: widget.isPassword == true ? isHide : false,
        obscuringCharacter: '*',
        style: AppTextStyles.body18w5,
        controller: widget.controller,
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.textInputType,
        cursorColor: AppColors.black,
        cursorHeight: 25,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          icon: widget.leading,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              AppTextStyles.body14w5.copyWith(
                color: AppColors.grey,
              ),
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(),
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  icon: Icon(
                    isHide ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black.withOpacity(.25),
                  ),
                  onPressed: () {
                    setState(() {
                      isHide = !isHide;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

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
    this.width, this.hintStyle,
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

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(widget.radius ?? 12.r)),
      child: Row(
        children: [
          widget.leading ?? const SizedBox.shrink(),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              obscureText: widget.isPassword == true ? isHide : false,
              obscuringCharacter: '*',
              style: AppTextStyles.body18w5,
              controller: widget.controller,
              onSubmitted: widget.onSubmitted,
              onChanged: widget.onChanged,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle:widget.hintStyle ,
                border: InputBorder.none,
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
          ),
        ],
      ),
    );
  }
}

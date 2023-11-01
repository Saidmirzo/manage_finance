import 'package:flutter/material.dart';
import 'package:manage_finance/config/constants/app_colors.dart';

class CustomChechBox extends StatefulWidget {
  const CustomChechBox({
    super.key,
    required this.onChange,
  });
  final ValueChanged<bool?> onChange;

  @override
  State<CustomChechBox> createState() => _CustomChechBoxState();
}

class _CustomChechBoxState extends State<CustomChechBox> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      value: val,
      activeColor: AppColors.primaryColor,
      onChanged: (value) {
        setState(() {
          val = !val;
        });
        widget.onChange(value);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/config/enums/sort_status.dart';

class CustomChechBox extends StatefulWidget {
  const CustomChechBox({
    super.key,
    required this.onChange,
  });
  final ValueChanged<SortStatus> onChange;

  @override
  State<CustomChechBox> createState() => _CustomChechBoxState();
}

class _CustomChechBoxState extends State<CustomChechBox> {
  SortStatus? val = SortStatus.name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Ism (o'sish)", style: AppTextStyles.body14w4),
          leading: Radio<SortStatus>(
            value: SortStatus.name,
            groupValue: val,
            onChanged: (SortStatus? value) {
              setState(() {
                val = value;
              });
              widget.onChange(val ?? SortStatus.name);
            },
          ),
        ),
        ListTile(
          title: Text("Ism (kamayish)", style: AppTextStyles.body14w4),
          leading: Radio<SortStatus>(
            value: SortStatus.nameDesc,
            groupValue: val,
            onChanged: (SortStatus? value) {
              setState(() {
                val = value;
              });
              widget.onChange(val ?? SortStatus.name);
            },
          ),
        ),
        ListTile(
          title: Text("To'lov (o'sish)", style: AppTextStyles.body14w4),
          leading: Radio<SortStatus>(
            value: SortStatus.payment,
            groupValue: val,
            onChanged: (SortStatus? value) {
              setState(() {
                val = value;
              });
              widget.onChange(val ?? SortStatus.name);
            },
          ),
        ),
        ListTile(
          title: Text("To'lov (kamayish)", style: AppTextStyles.body14w4),
          leading: Radio<SortStatus>(
            value: SortStatus.paymentDesc,
            groupValue: val,
            onChanged: (SortStatus? value) {
              setState(() {
                val = value;
              });
              widget.onChange(val ?? SortStatus.name);
            },
          ),
        ),
      ],
    );
  }
}

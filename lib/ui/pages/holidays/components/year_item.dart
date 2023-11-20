import 'package:flutter/material.dart';
import 'package:flutter_holiday_app/ui/components/components.dart';

class YearItem extends StatelessWidget {
  const YearItem({
    Key? key,
    required this.name,
    required this.onTap,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final String name;
  final Function onTap;
  final bool isSelected;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color,
                border: Border.all(
                  color: color!,
                  width: 1,
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: color!,
                  width: 1,
                ),
              ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          child: Text(
            name.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

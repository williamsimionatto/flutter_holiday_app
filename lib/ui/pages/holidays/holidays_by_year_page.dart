import 'package:flutter/material.dart';

import 'package:flutter_holiday_app/ui/components/components.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/components/year_item.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/components/year_list.dart';

class HolidaysByYearPage extends StatefulWidget {
  const HolidaysByYearPage({Key? key}) : super(key: key);

  @override
  State<HolidaysByYearPage> createState() => _HolidaysByYearPageState();
}

class _HolidaysByYearPageState extends State<HolidaysByYearPage> {
  final List<int> years = List.generate(
    10,
    (index) => DateTime.now().year + index,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feriados',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(right: 12, left: 4),
              child: YearList(years: years),
            ),
          )
        ],
      ),
    );
  }
}
